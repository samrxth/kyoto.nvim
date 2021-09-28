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

-- Global variables
require("globals")
-- Personal global variables
pcall(require, "personal-globals")
-- general configurations
require("options")
-- Plugin configurations
require("plugins")
-- Colors
require("colors.highlights")
-- Langauge server configuration
require("lsp-config")
-- Plugin configurations
require("plugins")
-- source our mappings last(may change)
vim.cmd("source ~/.config/nvim/viml/maps.vim")
-- auto-commands
vim.cmd("source ~/.config/nvim/viml/autocmd.vim")
-- user configurations
require("kyotorc")
