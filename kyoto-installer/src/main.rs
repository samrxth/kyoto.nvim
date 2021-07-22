pub mod downloader;

use std::{
    env::temp_dir,
    fs::{self, File},
    io, process,
};

use colored::Colorize;
use indicatif::{ProgressBar, ProgressStyle};

pub fn check_pip_installed() -> bool {
    match process::Command::new("pip3")
        .args(&["--version"])
        .stdout(process::Stdio::piped())
        .stdin(process::Stdio::piped())
        .stderr(process::Stdio::piped())
        .status()
    {
        Ok(ec) => ec.success(),
        Err(_) => false,
    }
}

pub fn check_node_installed() -> bool {
    match process::Command::new("node")
        .args(&["--version"])
        .stdout(process::Stdio::piped())
        .stdin(process::Stdio::piped())
        .stderr(process::Stdio::piped())
        .status()
    {
        Ok(ec) => ec.success(),
        Err(_) => false,
    }
}

pub async fn install_python() {
    let mut url = "";
    let mut file_name = String::new();

    if cfg!(target_os = "windows") {
        url = "https://www.python.org/ftp/python/3.9.6/python-3.9.6-amd64.exe";
        file_name = format!(r"{}\Python39Setup.exe", temp_dir().display().to_string());
    } else if cfg!(target_os = "macos") {
        url = "https://www.python.org/ftp/python/3.9.6/python-3.9.6-macosx10.9.pkg";
        file_name = format!("{}/Python39Setup.pkg", temp_dir().display().to_string());
    } else if cfg!(target_os = "linux") {
        url = "https://www.python.org/ftp/python/3.9.6/Python-3.9.6.tgz";
        file_name = format!("{}/Python39Setup.tar.gz", temp_dir().display().to_string());
    }

    downloader::threaded_download(url.to_string(), file_name.clone(), 7).await;

    if cfg!(target_os = "windows") {
        match process::Command::new("cmd")
            .arg("/C")
            .arg(file_name)
            .args(&["/qn", "/quiet", "/norestart"])
            .stdout(process::Stdio::piped())
            .stdin(process::Stdio::piped())
            .stderr(process::Stdio::piped())
            .spawn()
        {
            Ok(_) => {}
            Err(err) => {
                eprintln!(
                    "{}: failed to install python\ncause: {}",
                    "error".bright_red(),
                    err
                );
            }
        };
    } else if cfg!(target_os = "macos") {
    } else if cfg!(target_os = "linux") {
    }
}

pub async fn install_nodejs() {
    let mut url = "";
    let mut file_name = String::new();

    if cfg!(target_os = "windows") {
        url = "https://nodejs.org/dist/v14.17.3/node-v14.17.3-x64.msi";
        file_name = format!(r"{}\NodeJSSetup.exe", temp_dir().display().to_string());
    } else if cfg!(target_os = "macos") {
        url = "https://nodejs.org/dist/v14.17.3/node-v14.17.3.pkg";
        file_name = format!("{}/NodeJSSetup.pkg", temp_dir().display().to_string());
    } else if cfg!(target_os = "linux") {
        url = "https://nodejs.org/dist/v14.17.3/node-v14.17.3-linux-x64.tar.xz";
        file_name = format!("{}/NodeJSSetup.tar.xz", temp_dir().display().to_string());
    }

    downloader::threaded_download(url.to_string(), file_name.clone(), 5).await;

    if cfg!(target_os = "windows") {
        match process::Command::new("cmd")
            .arg("/C")
            .arg(file_name)
            .args(&["/qn", "/quiet", "/norestart"])
            .stdout(process::Stdio::piped())
            .stdin(process::Stdio::piped())
            .stderr(process::Stdio::piped())
            .spawn()
        {
            Ok(_) => {}
            Err(err) => {
                eprintln!(
                    "{}: failed to install nodejs\ncause: {}",
                    "error".bright_red(),
                    err
                );
            }
        };
    } else if cfg!(target_os = "macos") {
    } else if cfg!(target_os = "linux") {
    }
}

pub async fn install_nvim() {
    let mut url = "";
    let mut file_name = String::new();

    if cfg!(target_os = "windows") {
        url = "https://github.com/neovim/neovim/releases/download/v0.5.0/nvim-win64.zip";
        file_name = format!(
            r"{}\AppData\Local\nvim.zip",
            std::env::var("USERPROFILE").unwrap()
        );
    } else if cfg!(target_os = "macos") {
        url = "https://github.com/neovim/neovim/releases/download/v0.5.0/nvim-macos.tar.gz";
        file_name = format!("{}/nvim.tar.gz", std::env::var("HOME").unwrap());
    } else if cfg!(target_os = "linux") {
        file_name = format!("{}/nvim.tar.gz", std::env::var("HOME").unwrap());
    }

    downloader::threaded_download(url.to_string(), file_name.clone(), 3).await;

    if cfg!(target_os = "windows") {
        let fname = std::path::Path::new(&file_name);
        let file = File::open(&fname).unwrap();

        let mut archive = zip::ZipArchive::new(file).unwrap();
        let length = archive.len();

        let progress_bar = ProgressBar::new(length as u64);

        progress_bar.set_style(
            ProgressStyle::default_bar()
                .template("[{wide_bar:.cyan/blue/magenta}] {bytes}/{total_bytes} [ extracting ]")
                .progress_chars("=>-"),
        );

        for i in 0..length {
            let mut file = archive.by_index(i).unwrap();
            let outpath = match file.enclosed_name() {
                Some(path) => path.to_owned(),
                None => continue,
            };

            if (&*file.name()).ends_with('/') {
                std::fs::create_dir_all(&outpath).unwrap();
            } else {
                if let Some(p) = outpath.parent() {
                    if !p.exists() {
                        fs::create_dir_all(&p).unwrap();
                    }
                }
                let mut outfile = fs::File::create(&outpath).unwrap();
                io::copy(&mut file, &mut outfile).unwrap();
            }
            progress_bar.inc(1);
        }
    }
}

pub async fn get_nvim_version() {
    match process::Command::new("nvim").arg("--version").output() {
        Ok(text) => {
            let output = String::from_utf8(text.stdout).unwrap();
        }
        Err(_) => {
            println!("{}: installing neovim", "info".bright_magenta());
            install_nvim().await;
        }
    }
}

pub fn resume_installation() {
    match process::Command::new("pip3")
        .arg("install")
        .arg("pynvim")
        .status()
    {
        Ok(ec) => ec.success(),
        Err(_) => false,
    };
}

#[tokio::main]
async fn main() {
    #[cfg(windows)]
    ansi_term::enable_ansi_support().unwrap();

    get_nvim_version().await;

    let pip_installation = check_pip_installed();
    let node_installation = check_node_installed();

    println!("Running Pre-Flight Checks");

    if pip_installation && node_installation {
        resume_installation();
    } else {
        if !pip_installation {
            println!("{}: installing pip3", "info".bright_magenta());
            install_python().await;
        }
        if !node_installation {
            println!("{}: installing node-js", "note".bright_magenta());
            install_nodejs().await;
        }
        resume_installation();
    }
}
