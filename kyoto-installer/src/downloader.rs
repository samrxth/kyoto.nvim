use std::{
    env::temp_dir,
    fs::File,
    io::{BufReader, BufWriter, Write},
};

use colored::Colorize;
use indicatif::{ProgressBar, ProgressStyle};

fn get_splits(i: u64, total_length: u64, threads: u64) -> (u64, u64) {
    let mut start = ((total_length / threads) * (i - 1)) + 1;
    let mut end = (total_length / threads) * i;

    if i == 1 {
        start = 0;
    }

    if i == threads {
        end = total_length;
    }

    (start, end)
}

// https://gist.github.com/ZaphodElevated/059faa3c0c605f03369d0f84b9c8cfb9
pub async fn threaded_download(url: String, output: String, threads: u64) {
    let mut handles = vec![];
    let res = reqwest::get(url.to_string()).await.unwrap_or_else(|err| {
        eprintln!(
            "{}: failed to request {}\ncause: {}",
            "error".bright_red(),
            url,
            err
        );
        std::process::exit(1);
    });

    let total_length = res.content_length().unwrap_or_else(|| {
        eprintln!("{}: failed to get `Content-Length`\n", "error".bright_red());
        std::process::exit(1);
    });

    let temp = temp_dir();

    let progress_bar = ProgressBar::new(total_length);

    progress_bar.set_style(
        ProgressStyle::default_bar()
            .template(
                "[{elapsed_precise}] [{wide_bar:.cyan/blue/magenta}] {bytes}/{total_bytes} ({eta})",
            )
            .progress_chars("=>-"),
    );

    for index in 0..threads {
        let loc = format!(r"{}/Setup{}.tmp", temp.display().to_string(), index + 1);
        let (start, end) = get_splits(index + 1, total_length, threads);
        let pb = progress_bar.clone();

        let mut file = BufWriter::new(File::create(loc).unwrap());

        let url = url.clone();
        handles.push(tokio::spawn(async move {
            let client = reqwest::Client::new();
            let mut response = client
                .get(url.clone())
                .header("range", format!("bytes={}-{}", start, end))
                .send()
                .await
                .unwrap_or_else(|err| {
                    eprintln!(
                        "{}: failed to request {}\ncause: {}",
                        "error".bright_red(),
                        url.clone(),
                        err
                    );
                    std::process::exit(1);
                });

            while let Some(chunk) = response.chunk().await.unwrap_or_else(|err| {
                eprintln!(
                    "{}: failed to save Setup{}.tmp\ncause: {}",
                    "error".bright_red(),
                    index,
                    err
                );
                std::process::exit(1);
            }) {
                pb.inc(chunk.len() as u64);
                let _ = file.write(&*chunk);
            }
        }));
    }

    futures::future::join_all(handles).await;

    progress_bar.finish();

    let mut file = File::create(output.clone()).unwrap();

    for index in 0..threads {
        let loc = format!(r"{}/Setup{}.tmp", temp.display().to_string(), index + 1);
        let mut buf: Vec<u8> = vec![];
        let downloaded_file = File::open(loc.clone()).unwrap();
        let mut reader = BufReader::new(downloaded_file);
        std::io::copy(&mut reader, &mut buf).unwrap();
        file.write_all(&buf).unwrap();
        std::fs::remove_file(loc).unwrap();
    }
}
