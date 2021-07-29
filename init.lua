local vim = vim

-- line-numbers must be declared before dashboard
-- init because otherwise dashboard shows line numbers
vim.cmd [[set nu rnu]]

-- startscreen
require "plugins.dashboard-config"

-- load after startup
vim.defer_fn(function()
  -- autocomplete configuration
  require "plugins.compe-config"
  -- Langauge serer configuration
  require "lsp-config"
  -- general configurations
  require "options"
  -- user configurations
  require "kyotorc"
  -- lualine configuration
  require "plugins.statusline"
  -- nvim-bufferline.lua configuration
  require "plugins.top-bufferline"
  -- fuzzy finder configuration
  require "plugins.telescope-config"
  -- Git changes(showing in line number) configuration
  require "plugins.gitsigns-config"
  -- configuration to help you remember keybindings
  require "plugins.which-key-config"
  -- extra plugins(with shorter configs)
  require "plugins.misc"
  -- source our mappings last(may change)
  vim.cmd [[ source ~/.config/nvim/viml/maps.vim]]
  -- we can load packer last since we already have it compiled
  require "plugins"
  -- auto-commands
  vim.cmd [[ source ~/.config/nvim/viml/autocmd.vim ]]
end, 0)
