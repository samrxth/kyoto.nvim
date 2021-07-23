local vim = vim

require "options"
require "statusline"
require "top-bufferline"
require "compe-config"
require "telescope-config"
require "lsp-config"
require "dashboard-config"
require "gitsigns-config"

vim.defer_fn(function()
  require("plugins")
end, 0)

vim.cmd [[ source ~/.config/nvim/viml/maps.vim ]]
