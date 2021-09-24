local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system { "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path }
  execute "packadd packer.nvim"
end

return require("packer").startup({function(use)
  use("wbthomason/packer.nvim")

  use({
    "kyazdani42/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    config = function()
      require "kyoto.nvimtree"
    end
  })

  use("neovim/nvim-lspconfig")
  use("kabouzeid/nvim-lspinstall")
  use("glepnir/lspsaga.nvim")
  use {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      require "kyoto.cmp"
    end,
    requires = {
      { "hrsh7th/vim-vsnip",    after = "nvim-cmp" },
      { "hrsh7th/cmp-buffer",   after = "nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
      { "hrsh7th/cmp-path",     after = "nvim-cmp" }
    }
  }

  use({
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    run= ":TSUpdate",
    config = function()
      require "kyoto.tree-sitter"
    end,
    requires = {
      { "maxmellon/vim-jsx-pretty" },
      { "p00f/nvim-ts-rainbow", after = "nvim-treesitter" }
    }
  })

  use({
    "famiu/feline.nvim",
    config = function()
      require "kyoto.feline"
    end
  })

  use({
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    config = function()
      require("kyoto.telescope")
    end,
    requires = {{
      "nvim-telescope/telescope-fzf-native.nvim",
      run = "make"
    }}
  })

  use({
    "akinsho/nvim-bufferline.lua",
    config = function()
      require("kyoto.bufferline")
    end
  })

  use({
    "glepnir/dashboard-nvim",
    config = function()
      require("kyoto.dashboard")
    end
  })

  use({
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    }
  })

  use({
    "mhartington/formatter.nvim",
    cmd = "Format",
    config = function()
    end
  })

  use({
    "nvim-lua/popup.nvim",
    module = "popup"
  })

  use({
    "nvim-lua/plenary.nvim",
    module = "plenary"
  })

  use({
    "kyazdani42/nvim-web-devicons",
    module = "nvim-web-devicons"
  })

  use({"NvChad/nvim-base16.lua"})
end,
config = {
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "single" })
    end,
    prompt_border = "single",
  },
  git = {
    clone_timeout = 600,
  },
  auto_clean = true,
  compile_on_sync = true
}})
