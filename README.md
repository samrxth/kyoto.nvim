### Installation steps for vim config

- `npm i -g prettier`
- Then copy the .config/nvim folder to `~/.config/nvim/` and install vim plug
- Have python installed and change the python path in `let g:python3_host_prog` in the init.vim file.
- Run `nvim -c ":PlugInstall"`
  <br>

### Installation steps for fish config

- Install fish
- Copy the config.fish file to `~/.config/fish/config.fish`
- Install omf

```
curl -L https://get.oh-my.fish > install
```

- Install my fish theme

```
omf install sashimi
```
