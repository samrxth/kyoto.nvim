--          _/_
--        -'a\\
--          ||
--          |J
--          2_\\
--         /:::\\
--        |;ooo;|
--        /Oo@ o\\
--       '/o oOo\\`
--       /@ O o @\\
--      '/.o,()o,\\`
--      /().O O  o\\
--     / @ , @. () \\
--    /,o O' o O o, \\
-- _-'. 'o _o _O_o-o.`-_
-- `"""---......---"""`
--  K Y O T O    N V I M
-- https://github.com/samrath2007/kyoto.nvim

local vim = vim

-- line-numbers must be declared before dashboard
-- init because otherwise dashboard shows line numbers
vim.opt.nu = true
vim.opt.rnu = true

require("globals")
require("colors")
require("colors.highlights")
require("plugins.dashboard")

-- Langauge server configuration
require("lsp-config")
-- general configurations
require("options")
-- lualine configuration
require("plugins.statusline")
-- nvim-bufferline.lua configuration
require("plugins.bufferline")
-- fuzzy finder configuration
require("plugins.telescope")
-- Git changes(showing in line number) configuration
require("plugins.gitsigns")
-- configuration to help you remember keybindings
require("plugins.which-key")
-- extra plugins(with shorter configs)
require("plugins.misc")
-- Debug configuration
require("plugins.debug")
-- source our mappings last(may change)
vim.cmd("source ~/.config/nvim/viml/maps.vim")
-- auto-commands
vim.cmd("source ~/.config/nvim/viml/autocmd.vim")
-- user configurations
require("kyotorc")
