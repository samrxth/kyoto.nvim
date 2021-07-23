require("packer").startup(
  function(use)
    use "wbthomason/packer.nvim"
    use "onsails/lspkind-nvim"
    use {"kyazdani42/nvim-tree.lua", opt = true, cmd = {"NvimTreeToggle"}}

    use "mhartington/formatter.nvim"

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
    -- for lua development
    use "folke/lua-dev.nvim"
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
    use "yuttie/comfortable-motion.vim"
    use {
      "lewis6991/gitsigns.nvim",
      requires = {
        "nvim-lua/plenary.nvim"
      }
    }
    use "simrat39/symbols-outline.nvim"
    use "folke/which-key.nvim"
    use "tpope/vim-fugitive"

    for _, plugin in ipairs(vim.g.kyoto_extra_plugins) do
      use plugin
    end
  end
)
