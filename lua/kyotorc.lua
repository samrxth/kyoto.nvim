local utils = require("core.utils")
local opts = { silent = true, noremap = true }

vim.g.mapleader = " "
utils.map("n", "<Leader>nn",  ":NvimTreeToggle<CR>", opts)
utils.map("n", "<Leader>ff", ":Telescope find_files hidden=true<CR>", opts)

_G.kyoto = {
  syntax_highlighting = {"javascript", "lua", "c"},
  theme = "nord"
}

