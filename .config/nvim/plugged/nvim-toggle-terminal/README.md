Toggle terminal buffer or create new one if there is none.
It keeps the shell session between toggles.

<p align="center">
   <img src="https://i.imgur.com/vL96PcL.gif">
<p>

You have to set your own key bindings. For example:

```vim
nnoremap <silent> <C-z> :ToggleTerminal<Enter>
tnoremap <silent> <C-z> <C-\><C-n>:ToggleTerminal<Enter>
```

## Commands

| Command               | Description                                                                                         |
|-----------------------|-----------------------------------------------------------------------------------------------------|
| :ToggleTerminal       | Toggles a terminal which is the same shell instance regardless of where it is called                |
| :ToggleTabTerminal    | Toggles a tab specific terminal instance. It will have a different shell session for each tab            |
| :ToggleWindowTerminal | Toggles a window specific terminal instance. It will have a different shell session for each window |

## Settings

| Setting                     | Description                                                                               | Default |
|-----------------------------|-------------------------------------------------------------------------------------------|---------|
| g:preserve_alternate_buffer | Preserve the alternate_buffer of the current window when opening and closing the terminal | 1       |
| g:auto_start_insert         | enter insert mode automatically when given focus. Uses BufEnter event                     | 0       |
| g:open_in_insert_mode       | start in insert mode when you open the terminal. Uses BufWinEnter event                   | 1       |

## Instalation

Use your favourite plugin manager. For example, using [Plug](https://github.com/junegunn/vim-plug):

```vim
call plug#begin()
Plug 'caenrique/nvim-toggle-terminal'
call plug#end()
```

## Other useful settings

Some extra setting that can be used in conjuction with this plugin for convenience:

Make your life easier by mapping ESC in terminal mode. And if you use fzf, this will not break the ESC behaviour:

```vim
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
```

Use this to switch back and forth between files and terminal without the anoying `No write since last change (add ! to override)` message with unsaved changes:

```vim
set autowriteall
```

Use [nvr](https://github.com/mhinz/neovim-remote) to avoid nesting nvim in Terminal buffers. This should go in your `.bashrc` or similar:

```bash
nvim_wrapper() {
  if test -z $NVIM_LISTEN_ADDRESS; then
      nvim $argv
  else
    if test -z $argv; then
        nvr -l -c new
    else
        nvr -l $argv
    fi
  fi
}

alias nvim="nvim_wrapper"
```
