local packer = require("packer")
local use = packer.use

return packer.startup(function()
    use "wbthomason/packer.nvim"
    use "onsails/lspkind-nvim"
    use "kyazdani42/nvim-tree.lua"
    use "glepnir/lspsaga.nvim"
    use "mattn/emmet-vim"
    use "norcalli/nvim_utils"
    use "kabouzeid/nvim-lspinstall"
    use "nvim-treesitter/nvim-treesitter"
    use "hrsh7th/nvim-compe"
    use "neovim/nvim-lspconfig"
    use "andrejlevkovitch/vim-lua-format"
    use "folke/tokyonight.nvim"
    use "tpope/vim-fugitive"
    use "folke/which-key.nvim"
    use {"lewis6991/gitsigns.nvim", requires = {'nvim-lua/plenary.nvim'}}
    use ({"hoob3rt/lualine.nvim", requires = "nvim-web-devicons"})
    use "jiangmiao/auto-pairs"
    use "mlaursen/vim-react-snippets"
    use "lukas-reineke/indent-blankline.nvim"
    use "prettier/vim-prettier"
    use "kyazdani42/nvim-web-devicons"
    use "vimwiki/vimwiki"
    use "glepnir/dashboard-nvim"
    use {
        "nvim-telescope/telescope.nvim",
        requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
    }

    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use {
        "akinsho/nvim-bufferline.lua",
        requires = "kyazdani42/nvim-web-devicons"
    }
end, {
    display = {
        border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"}
    },
    config = {display = {open_fn = require("packer.util").float}}
})
