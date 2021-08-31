local vim = vim
local g = vim.g

-- line-numbers must be declared before dashboard
-- init because otherwise dashboard shows line numbers
vim.opt.nu = true
vim.opt.rnu = true

require("globals")
require("plugins.dashboard")

-- autocomplete configuration
require("plugins.compe")
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
-- source our mappings last(may change)
vim.cmd("source ~/.config/nvim/viml/maps.vim")
-- auto-commands
vim.cmd("source ~/.config/nvim/viml/autocmd.vim")
-- user configurations
require("kyotorc")
