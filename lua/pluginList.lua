require("packer").startup(
  function(use)
    use "wbthomason/packer.nvim"
    use "onsails/lspkind-nvim"
    use {"kyazdani42/nvim-tree.lua", opt = true, cmd = {"NvimTreeToggle"}}

    use "glepnir/lspsaga.nvim"
    use "kabouzeid/nvim-lspinstall"
    use "nvim-treesitter/nvim-treesitter"
    use "hrsh7th/nvim-compe"
    use "neovim/nvim-lspconfig"
    use "folke/tokyonight.nvim"
    use {
      "hoob3rt/lualine.nvim",
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
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
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons"
    }

    use {
      "glepnir/dashboard-nvim",
      opt = true,
      cmd = {
        "Dashboard",
        "DashboardChangeColorscheme",
        "DashboardFindFile",
        "DashboardFindHistory",
        "DashboardFindWord",
        "DashboardJumpMarks",
        "DashboardNewfile"
      }
    }

    use {
      "lewis6991/gitsigns.nvim",
      requires = {
        "nvim-lua/plenary.nvim"
      }
    }

    use "simrat39/symbols-outline.nvim"
    use "folke/which-key.nvim"
    use "tpope/vim-commentary"
    use "kdheepak/lazygit.nvim"
    use "yuttie/comfortable-motion.vim"
    use {
      "mhartington/formatter.nvim",
      opt = true
    }
    use {
      "folke/twilight.nvim",
      opt = true
    }
    use "gelguy/wilder.nvim"
    use {"maxmellon/vim-jsx-pretty", opt = true}
    use {
      "folke/zen-mode.nvim",
      opt = true
    }

    use {"tweekmonster/startuptime.vim", opt = true}

    for _, plugin in ipairs(vim.g.kyoto_extra_plugins) do
      use(plugin)
    end
  end
)
