lua require("init")
let mapleader=","
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ]
let g:nvim_tree_update_cwd = 1
let g:nvim_tree_side = 'right'
let g:nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard' ]

set relativenumber

command! Conf :e ~/.config/nvim/init.vim
command! Cdconf :cd ~/.config/nvim

nnoremap <silent> <C-z> :ToggleTerminal<Enter>
tnoremap <silent> <C-z> <C-\><C-n>:ToggleTerminal<Enter>
nnoremap y "*y
vnoremap y "*y
nnoremap x "*x
vnoremap x "*x
nnoremap p "*p
vnoremap p "*p
nnoremap <leader>a ggVG
nnoremap <leader>nn :NvimTreeToggle<CR>
nnoremap <leader>ff :Telescope find_files hidden=true<CR>
nnoremap <leader>fg :Telescope live_grep<CR>
nnoremap <leader>fb :Telescope buffers<CR>
nnoremap <leader>fh :Telescope help_tags<CR>
nnoremap <leader>nn :NvimTreeToggle<CR>
nnoremap <leader>cc :CommentToggle<CR>
inoremap <expr> <cr> getline(".")[col(".")-2:col(".")-1]=="{}" ? "<cr><esc>O" : "<cr>"
cnoreabbrev q bd
cnoreabbrev wq w<bar>bd
cnoreabbrev Wq w<bar>bd
cnoreabbrev WQ w<bar>bd
cnoreabbrev Qa qa
cnoreabbrev Wqa wqa
cnoreabbrev W w
cnoreabbrev Q q
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)



let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-json',
  \ 'coc-emmet',
  \ 'coc-tailwindcss',
  \ 'coc-tabnine',
  \ ]


let g:python3_host_prog = '/usr/local/bin/python3'

