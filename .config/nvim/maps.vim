nnoremap <leader>nn :NvimTreeToggle<CR>
nnoremap <silent>[b :BufferLineCycleNext<CR>
nnoremap <silent>b] :BufferLineCyclePrev<CR>
nnoremap <silent><mymap> :BufferLineMoveNext<CR>
nnoremap <silent><mymap> :BufferLineMovePrev<CR>
nnoremap <silent>be :BufferLineSortByExtension<CR>
nnoremap <silent>bd :BufferLineSortByDirectory<CR>
nnoremap <silent><mymap> :lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
cnoreabbrev q bd
cnoreabbrev wq w<bar>bd
cnoreabbrev W w
cnoreabbrev Q q
nnoremap y "*y
vnoremap y "*y
nnoremap x "*x
vnoremap x "*x
nnoremap p "*p
vnoremap p "*p
inoremap jk <ESC>
nnoremap <leader>a ggVG
nnoremap <D-v> "*pmap <A-S-u> <C-u>
map <Up> gk
map <Down> gj
nnoremap <D-c> "*y
nnoremap <D-x> "*x
map gn :bn<cr>
map gp :bp<cr>
map <A-S-d> <C-d>
map <A-h> <C-w>h
map <leader>h <C-w>h
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>l <C-w>l
map <A-j> <C-w>j
map <A-k> <C-w>k
map <A-l> <C-w>l
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
vnoremap <A-Tab> :norm i  <CR>
vnoremap <A-/> :norm i//<CR>
vnoremap <A-\> :norm xx<CR>
map <A-r> :source % <CR>
map <A-i> :PlugInstall <CR>
map <A-Return> :FloatermToggle <CR>
map <A-S-l> :vsp <CR>
map <A-S-j> :sp <CR>
map <A-C-j> :res +5 <CR>
map <A-C-k> :res -5 <CR>
map <A-C-l> :vertical resize +5 <CR>
map <A-C-h> :vertical resize -5 <CR>
map e :e ~/.config/nvim/init.vim <CR>
map <A-g> :Goyo <CR>
map <A-e> :e ~/.config/nvim/init.vim <CR>
nnoremap <silent>    <C-h> :BufferMovePrevious<CR>
nnoremap <silent>    <C-l> :BufferMoveNext<CR>
