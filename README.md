# Dotfiles
## Vim screenshot
![Screenshot](https://raw.githubusercontent.com/samrath2007/Dotfiles/main/Screenshot%202021-06-01%20at%204.03.30%20PM.png)
![Screenshot](https://raw.githubusercontent.com/samrath2007/Dotfiles/main/Screenshot%202021-06-01%20at%204.03.37%20PM.png)
## Fish screenshot
![Screenshot](https://github.com/samrath2007/Dotfiles/blob/main/Screenshot%202021-05-26%20at%2011.08.05%20AM.png)

### Installation steps for vim config
- `npm i -g prettier`
- Then copy the init.vim file to `~/.config/nvim/init.vim` and install vim plug
- Have python installed and change the python path in `let g:python3_host_prog` in the init.vim file.
- Run `nvim -c ":PlugInstall"`
### Installation steps for fish config
- Install fish
- Copy the config.fish file to `~/.config/fish/config.fish`
- Install omf
```
curl -L https://get.oh-my.fish > install
```
- Install my fish theme
```
omf install bobthefish
```
