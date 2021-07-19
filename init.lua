require "options"
-- load all plugins
require "pluginList"

local vim = vim

require "statusline"
require "top-bufferline"
require "coc-config"
require "dashboard-conf"
require "telescope-conf"
require "general"

vim.cmd("source ~/.config/nvim/mappings.vim")