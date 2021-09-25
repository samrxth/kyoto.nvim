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
      require("kyoto.nvimtree")
    end,
    setup = function()
      _G.kyoto.keybindings.plugins.nvimtree()
    end
  })

  use("neovim/nvim-lspconfig")
  use("kabouzeid/nvim-lspinstall")
  use({
    "glepnir/lspsaga.nvim",
    config = function()
      require("kyoto.lspsaga")
    end
  })
  use {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      require("kyoto.cmp")
    end,
    requires = {
      { "hrsh7th/vim-vsnip",    after = "nvim-cmp" },
      { "hrsh7th/cmp-buffer",   after = "nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
      { "hrsh7th/cmp-path",     after = "nvim-cmp" },
      {
        "windwp/nvim-autopairs",
        module = {"nvim-autopairs", "nvim-autopairs.completion.cmp"},
        opt = _G.kyoto.plugins.autopairs
      }
    }
  }

  -- Treesitter (and other syntax plugins)
  use({
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    run= ":TSUpdate",
    config = function()
      require("kyoto.tree-sitter")
    end,
    requires = {
      { "p00f/nvim-ts-rainbow", after = "nvim-treesitter" },
      { "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" }
    }
  })
  use({
    "maxmellon/vim-jsx-pretty",
    ft = { "javascript", "javascriptreact",
    "typescript", "typescriptreact" }
  })

  -- Bufferline
  use({
    "akinsho/nvim-bufferline.lua",
    config = function()
      require("kyoto.bufferline")
    end
  })

  -- Statusline
  use({
    "famiu/feline.nvim",
    config = function()
      require("kyoto.feline")
    end
  })

  -- Fuzzy Finder (Telescope)
  use({
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    module = "telescope",
    config = function()
      require("kyoto.telescope")
    end,
    setup = function()
      _G.kyoto.keybindings.plugins.telescope()
    end,
    requires = {
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      {
        "ahmedkhalf/project.nvim",
        config = function()
          require("kyoto.project")
        end
      }
    }
  })

  -- Dashboard and Project Explorer
  use({
    "glepnir/dashboard-nvim",
    config = function()
      require("kyoto.dashboard")
    end
  })

  -- Trouble
  use({
    "folke/trouble.nvim",
    cmd = {"Trouble", "TroubleToggle"},
    config = function()
      require("kyoto.trouble")
    end,
    setup = function()
      _G.kyoto.keybindings.plugins.trouble()
    end
  })

  -- Gitsigns
  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("kyoto.gitsigns")
    end,
    requires = {
      "nvim-lua/plenary.nvim",
    }
  })

  -- Formatter
  -- Formatters must be installed separately
  use({
    "mhartington/formatter.nvim",
    cmd = "Format",
    config = function()
    end
  })

  -- Colorschemes
  use({"NvChad/nvim-base16.lua"})

  -- Modules (required by many plugins)
  use({ "nvim-lua/popup.nvim", module = "popup" })
  use({ "nvim-lua/plenary.nvim", module = "plenary" })
  use({ "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" })
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
