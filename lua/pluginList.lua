local packer = require("packer")
local use = packer.use

return packer.startup(function()
    use "wbthomason/packer.nvim"

    use "rmagatti/auto-session"

    use "norcalli/nvim_utils"

    use "nvim-treesitter/nvim-treesitter"

    use "andrejlevkovitch/vim-lua-format"

    use "wakatime/vim-wakatime"

    use "liuchengxu/vista.vim"

    use "folke/tokyonight.nvim"

    use "tpope/vim-fugitive"

    use "folke/which-key.nvim"

    use {"lewis6991/gitsigns.nvim", requires = {'nvim-lua/plenary.nvim'}}

    use({"hoob3rt/lualine.nvim", requires = "nvim-web-devicons"})

    use "jiangmiao/auto-pairs"

    use "mlaursen/vim-react-snippets"

    use "jremmen/vim-ripgrep"

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
        "akinsho/nvim-bufferline.lua",
        requires = "kyazdani42/nvim-web-devicons"
    }

    use "neoclide/coc.nvim"
end, {
    display = {
        border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"}
    },
    config = {display = {open_fn = require("packer.util").float}}
})
