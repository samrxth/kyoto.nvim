local vim = vim

-- line-numbers must be declared before dashboard
-- init because otherwise dashboard shows line numbers
vim.cmd [[set nu rnu]]

-- startscreen
require "dashboard-config"

-- load after startup
vim.defer_fn(function()
  -- autocomplete configuration
  require "compe-config"
  -- Langauge serer configuration
  require "lsp-config"
  -- general configurations
  require "options"
  -- user configurations
  require "kyotorc"
  -- lualine configuration
  require "statusline"
  -- nvim-bufferline.lua configuration
  require "top-bufferline"
  -- fuzzy finder configuration
  require "telescope-config"
  -- Git changes(showing in line number) configuration
  require "gitsigns-config"
  -- configuration to help you remember keybindings
  require "which-key-config"
  -- source our mappings last(may change)
  vim.cmd [[ source ~/.config/nvim/viml/maps.vim]]
  -- we can load packer last since we already have it compiled
  require "plugins"
  -- auto-commands
  vim.cmd [[ source ~/.config/nvim/viml/general.vim ]]
end, 0)
