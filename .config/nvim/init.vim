call plug#begin('~/.config/nvim/plugged')
  "General
  Plug 'ayu-theme/ayu-vim'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  Plug 'wincent/terminus'
  Plug 'kyazdani42/nvim-web-devicons' " for file icons
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'caenrique/nvim-toggle-terminal'
  Plug 'wakatime/vim-wakatime'
  Plug 'glepnir/dashboard-nvim'
  Plug 'vimwiki/vimwiki'
  
  "TypeScript and JavaScript
  Plug 'leafgarland/typescript-vim'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'pangloss/vim-javascript'


  " The one and only coc.nvim
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
call plug#end()

source ~/.config/nvim/plugins.vim
source ~/.config/nvim/ui.vim
source ~/.config/nvim/au.vim
source ~/.config/nvim/set.vim
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/coc-conf.vim
source ~/.config/nvim/maps.vim
