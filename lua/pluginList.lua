local packer = require("packer")
local use = packer.use

return packer.startup(function()
    use "wbthomason/packer.nvim"
    use "onsails/lspkind-nvim"
    use "kyazdani42/nvim-tree.lua"
    use "glepnir/lspsaga.nvim"
    use "mattn/emmet-vim"
    use "kabouzeid/nvim-lspinstall"
    use "nvim-treesitter/nvim-treesitter"
    use "hrsh7th/nvim-compe"
    use "neovim/nvim-lspconfig"
    use "andrejlevkovitch/vim-lua-format"
    use {
        "folke/tokyonight.nvim",
        config = function()
            vim.cmd [[
        colorscheme tokyonight
        set nu rnu
      ]]
        end
    }

    use "tpope/vim-fugitive"
    use {
        "folke/which-key.nvim",
        config = function()
            require'which-key'.setup {}
        end
    }

    use {
        "lewis6991/gitsigns.nvim",
        requires = {'nvim-lua/plenary.nvim'},
        config = function()
            require'gitsigns'.setup {}
        end
    }

    use({
        "hoob3rt/lualine.nvim",
        requires = "nvim-web-devicons"
    })

    use "jiangmiao/auto-pairs"
    use "mlaursen/vim-react-snippets"
    use "lukas-reineke/indent-blankline.nvim"
    use "prettier/vim-prettier"
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
            require'trouble'.setup {}
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
    config = {
        display = {
            open_fn = require("packer.util").float
        }
    }
})
