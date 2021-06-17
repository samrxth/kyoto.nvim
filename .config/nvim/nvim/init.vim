let mapleader = ","

call plug#begin()
  Plug 'wincent/terminus'
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/playground'
  Plug 'sainnhe/gruvbox-material'
  Plug 'leafgarland/typescript-vim'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'kyazdani42/nvim-web-devicons' " for file icons
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'glepnir/spaceline.vim'
  Plug 'pangloss/vim-javascript'
  Plug 'tomasiser/vim-code-dark'
  Plug 'tarebyte/nvim-base16'
  Plug 'akinsho/nvim-bufferline.lua'
  Plug 'norcalli/nvim.lua'
  Plug 'norcalli/nvim-base16.lua'
  Plug 'Th3Whit3Wolf/one-nvim'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'shaunsingh/nord.nvim'
  Plug 'majutsushi/tagbar'
  Plug 'neovim/nvim-lspconfig'
  Plug 'mhinz/vim-startify'
  Plug 'onsails/lspkind-nvim'
  Plug 'vimwiki/vimwiki'
call plug#end()




filetype plugin on
source ~/.config/nvim/ui.vim
source ~/.config/nvim/maps.vim
source ~/.config/nvim/au.vim
source ~/.config/nvim/set.vim
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/coc-conf.vim
