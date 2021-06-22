local g = vim.g
local vim = vim
require("init")
g.mapleader=","
g.coc_global_extensions = {
  'coc-snippets',
  'coc-pairs',
  'coc-tsserver',
  'coc-eslint',
  'coc-json',
  'coc-emmet',
  'coc-tailwindcss',
  'coc-tabnine',
  }

g.python3_host_prog = '/usr/local/bin/python3'
vim.cmd("source ~/.config/nvim/maps.vim")
