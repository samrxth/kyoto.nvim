require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'lambdalisue/fern.vim'
  use 'lambdalisue/nerdfont.vim'
  use "onsails/lspkind-nvim"
  use "kyazdani42/nvim-tree.lua"
  use "glepnir/lspsaga.nvim"
  use "kabouzeid/nvim-lspinstall"
  use "nvim-treesitter/nvim-treesitter"
  use "hrsh7th/nvim-compe"
  use "neovim/nvim-lspconfig"
  use 'lambdalisue/fern-renderer-nerdfont.vim'
  use 'folke/tokyonight.nvim'
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {
    "nvim-telescope/telescope.nvim",
    requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
  }
  use {
    "akinsho/nvim-bufferline.lua",
    requires = "kyazdani42/nvim-web-devicons"
  }
  use "jiangmiao/auto-pairs"
  -- for lua development
  use "folke/lua-dev.nvim"
  use "glepnir/dashboard-nvim"
end)
