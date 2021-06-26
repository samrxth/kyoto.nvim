local cmd = vim.cmd
local g = vim.g
local vim = vim

-- load all plugins
require "pluginList"
require "misc-utils"

require "top-bufferline"
require "statusline"

require("colorizer").setup()
require("neoscroll").setup() -- smooth scroll


g.auto_save = 0

local base16 = require "base16"
base16(base16.themes["onedark"], true)

require "highlights"

g.indentLine_enabled = 1

g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard"}
g.indent_blankline_buftype_exclude = {"terminal"}

g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_show_first_indent_level = false

require "telescope-nvim"
require "nvimTree" -- file tree stuff
require "file-icons"

require("nvim-autopairs").setup()

require "whichkey"
require "dashboard"
require("mappings")
require("nvim_comment").setup()

-- Set some global variables
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

vim.o.relativenumber = true
