let g:lightline = { 'colorscheme': 'plastic' }
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
let g:deoplete#enable_at_startup = 1
let g:dashboard_default_executive ='telescope'
let g:tagbar_winsize = 8
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ]
let g:nvim_tree_width = 25
let g:nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard' ]
let g:battery#update_tabline = 1    " For tabline.
let g:nord_cursor_line_number_background = 1
let g:nord_italic = 1
let g:nord_bold = 0
let g:python3_host_prog = '/usr/local/bin/python3'
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open:
let g:indentLine_enabled = 1
let g:indentLine_char_list = ['▏']
let g:indentLine_setConceal = 1
let g:one_allow_italics = 1
let g:vimwiki_list = [{'path':'~/Documents/vimwiki'},
            \ {'path': '~/Desktop/ECONOMICS/Notes/Chapter1-Notes'},
            \ {'path': '~/Desktop/ECONOMICS/Notes/Chapter2-Notes'},
            \ {'path': '~/Desktop/ECONOMICS/Notes/Chapter3-Notes'},
            \ {'path': '~/Desktop/ECONOMICS/Notes/EcoNotes'},
            \ {'path': '~/Desktop/Comp-Sci/Notes/Chapter1'},
            \ {'path': '~/Desktop/German/DSD/'},
            \ {'path': '~/Desktop/1M1B/vimwiki'},
            \ {'path': '~/Desktop/Biology/Notes/PPT'},
            \]

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

lua << EOF
local g = vim.g

g.startify_enable_special = 0
g.startify_session_autoload = 1
g.startify_session_delete_buffers = 1
g.startify_change_to_vcs_root = 1
g.startify_fortune_use_unicode = 1
g.startify_session_persistence = 1

--[[ -- Custom Header
----------------
local cwd = vim.fn.split(vim.fn.getcwd(), '/')
local banner = vim.fn.system("figlet -f 3d "..cwd[#cwd])
local header = vim.fn['startify#pad'](vim.fn.split(banner, '\n'))
vim.g.startify_custom_header = header ]]

g.startify_lists = {
  { type = 'dir', header = { "   Current Directory "..vim.fn.getcwd()..":" } },
  { type = 'bookmarks', header = { '   Bookmarks' } }
}

g.startify_bookmarks = {
  { i = '~/.config/nvim/init.vim'},
  { m = '~/.config/nvim/maps.vim'},
  { p = '~/.config/nvim/plugins.vim'},
  { c = '~/.config/nvim/coc-conf.vim'},
  { s = '~/.config/nvim/set.vim'},
  { a = '~/.config/nvim/au.vim'},
  { u = '~/.config/nvim/ui.vim'},
  { f = '~/.config/fish/config.fish'},
}

EOF

lua << EOF
require('telescope').setup{ defaults = { file_ignore_patterns = {"node_modules", "public", "fonts"} } }
EOF
