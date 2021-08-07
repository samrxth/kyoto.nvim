local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    "git",
    "clone",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  execute("packadd packer.nvim")
end

require("packer").startup(function(use)
  use("onsails/lspkind-nvim")
  use({ "kyazdani42/nvim-tree.lua", opt = true, cmd = { "NvimTreeToggle" } })
  use("glepnir/lspsaga.nvim")
  use("kabouzeid/nvim-lspinstall")
  use({
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    run = ":TSUpdate",
  })
  use("hrsh7th/nvim-compe")
  use("neovim/nvim-lspconfig")
  use("folke/tokyonight.nvim")
  use({
    "hoob3rt/lualine.nvim",
    event = "BufWinEnter",
    config = function()
      require("plugins.statusline")
    end,
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })

  use({
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    config = function()
      require("plugins.telescope-config")
    end,
    requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
  })

  use({
    "akinsho/nvim-bufferline.lua",
    event = "BufWinEnter",
    config = function()
      require("plugins.top-bufferline")
    end,
    requires = "kyazdani42/nvim-web-devicons",
  })

  use("jiangmiao/auto-pairs")
  use({
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    config = function()
      require("trouble").setup()
    end,
    requires = "kyazdani42/nvim-web-devicons",
  })

  use({
    "glepnir/dashboard-nvim",
    opt = true,
    cmd = {
      "Dashboard",
      "DashboardChangeColorscheme",
      "DashboardFindFile",
      "DashboardFindHistory",
      "DashboardFindWord",
      "DashboardJumpMarks",
      "DashboardNewfile",
    },
  })

  use({
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = function()
      require("plugins.gitsigns-config")
    end,
    requires = {
      "nvim-lua/plenary.nvim",
    },
  })

  use("simrat39/symbols-outline.nvim")
  use("folke/which-key.nvim")
  use("tpope/vim-commentary")
  use("kdheepak/lazygit.nvim")
  use("yuttie/comfortable-motion.vim")
  use({
    "folke/twilight.nvim",
    opt = true,
  })
  use("gelguy/wilder.nvim")
  use({ "maxmellon/vim-jsx-pretty", opt = true })
  use({
    "folke/zen-mode.nvim",
    opt = true,
  })

  use({ "tweekmonster/startuptime.vim", opt = true })

  use("ray-x/lsp_signature.nvim")

  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  for _, plugin in ipairs(vim.g.kyoto_extra_plugins) do
    use(plugin)
  end
end)
