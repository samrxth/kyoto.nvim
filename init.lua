local vim = vim

vim.cmd [[ source ~/.config/nvim/viml/general.vim ]]
require "options"
require "kyotorc"
require "dashboard-config"

vim.defer_fn(function()
  require "statusline"
  require "top-bufferline"
  require "compe-config"
  require "telescope-config"
  require "lsp-config"
  require "gitsigns-config"
  require "which-key-config"
  require "plugins"
  vim.cmd [[ source ~/.config/nvim/viml/maps.vim ]]
end, 0)

