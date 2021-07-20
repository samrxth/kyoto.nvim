require "options"
-- load all plugins

local vim = vim

require "statusline"
require "top-bufferline"
require "coc-config"
require "dashboard-conf"
require "telescope-conf"
require "general"
require "au"

vim.cmd("source ~/.config/nvim/mappings.vim")
