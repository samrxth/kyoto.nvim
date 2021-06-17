# One Neovim Theme

An Atom One inspired dark and light colorscheme for neovim. Plugin modeled after [highlite.vim](https://github.com/Iron-E/nvim-highlite/blob/master/colors/highlite.vim) template

## Screenshots

Dark theme

![dark theme](assets/dark.png)

Light theme

![light theme](assets/light.png)

*Font:* Jet Brains Mono
*Statusline:* [Spaceline](https://github.com/glepnir/spaceline.vim)
*RGB Highlightin:* [nvim-colorizer.](https://github.com/norcalli/nvim-colorizer.lua)
*Minimap* [minimap.vim](https://github.com/wfxr/minimap.vim)

## Prerequisites

1. Neovim 0.5+

### Installation

#### Vim Plug

```vim
Plug 'Th3Whit3Wolf/one-nvim'

" And then somewhere in your init.vim, to set the colorscheme
colorscheme one-nvim
```

#### Minpac

```vim
call minpac#add('Th3Whit3Wolf/one-nvim')

" And then somewhere in your init.vim, to set the colorscheme
colorscheme one-nvim
```

#### Vim Packages

In the terminal execute this command.

```sh
cd ~/.local/share/nvim/site/pack/opt/
git clone https://github.com/Th3Whit3Wolf/one-nvim
```

In your `init.vim` add the following

```vim
packadd! one-nvim
```

```vim
colorscheme one-nvim
```

### Transparent background
###### Require terminal with transparent background

```lua
vim.g.one_nvim_transparent_bg = true
```

### NOTE

- Vim is not supported because the theme is written in lua.
- If you feel like a language should be highlighted differently please open an issue.
