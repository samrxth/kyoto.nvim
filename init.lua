local vim = vim

-- auto-commands and relative numbers
vim.cmd [[ source ~/.config/nvim/viml/general.vim ]]
-- general configurations
require "options"
-- user configurations
require "kyotorc"
-- startscreen
require "dashboard-config"

-- load after startup
vim.defer_fn(function()
  -- lualine configuration
  require "statusline"
  -- nvim-bufferline.lua configuration
  require "top-bufferline"
  -- autocomplete configuration
  require "compe-config"
  -- fuzzy finder configuration
  require "telescope-config"
  -- Langauge serer configuration
  require "lsp-config"
  -- Git changes(showing in line number) configuration
  require "gitsigns-config"
  -- configuration to help you remember keybindings
  require "which-key-config"
  -- we can load packer last since we already have it compiled
  require "plugins"
  -- source our mappings last(may change)
  vim.cmd [[ source ~/.config/nvim/viml/maps.vim ]]
end, 0)

