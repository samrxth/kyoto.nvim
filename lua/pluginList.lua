local packer = require("packer")
local use = packer.use

return packer.startup(
    function()
        use "wbthomason/packer.nvim"

        use "wakatime/vim-wakatime"

        use "liuchengxu/vista.vim"

        use "folke/tokyonight.nvim"

        use "folke/which-key.nvim"

        use {
          'lewis6991/gitsigns.nvim',
          requires = {
            'nvim-lua/plenary.nvim'
          }
        }

        use "ful1e5/onedark.nvim"

        use "jiangmiao/auto-pairs"

        use({
          "hoob3rt/lualine.nvim",
          requires = "nvim-web-devicons",
        })

        use "mlaursen/vim-react-snippets"

        use "jremmen/vim-ripgrep"

        use "lukas-reineke/indent-blankline.nvim"

        use "lambdalisue/gina.vim"

        use "prettier/vim-prettier"

        use "kyazdani42/nvim-web-devicons"

        use "vimwiki/vimwiki"

        use "glepnir/dashboard-nvim"

        use {
          "nvim-telescope/telescope.nvim",
          requires = {{"nvim-lua/popup.nvim"}, {'nvim-lua/plenary.nvim'}}
        }

        use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}

        use "neoclide/coc.nvim"
    end,
    {
        display = {
            border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"}
        }
    }
)
