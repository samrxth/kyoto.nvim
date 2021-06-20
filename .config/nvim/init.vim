let mapleader = ","

call plug#begin('~/.config/nvim/plugged')
  "General
  Plug 'romgrk/doom-one.vim'
  Plug 'preservim/nerdcommenter'
  Plug 'arcticicestudio/nord-vim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'wincent/terminus'
  Plug 'kyazdani42/nvim-web-devicons' " for file icons
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'caenrique/nvim-toggle-terminal'
  Plug 'nvim-treesitter/playground'
  Plug 'norcalli/nvim.lua'
  Plug 'wakatime/vim-wakatime'
  Plug 'majutsushi/tagbar'
  Plug 'akinsho/nvim-bufferline.lua'
  Plug 'vimwiki/vimwiki'
  Plug 'mhinz/vim-startify'
  Plug 'francoiscabrol/ranger.vim'
  Plug 'rbgrouleff/bclose.vim'

  
  "TypeScript and JavaScript
  Plug 'leafgarland/typescript-vim'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'pangloss/vim-javascript'


  " The one and only coc.nvim
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
call plug#end()




filetype plugin on
source ~/.config/nvim/ui.vim
source ~/.config/nvim/maps.vim
source ~/.config/nvim/au.vim
source ~/.config/nvim/set.vim
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/coc-conf.vim
set relativenumber
