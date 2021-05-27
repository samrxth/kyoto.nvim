"" ~/.config/nvim/init.vim
"" Install vim plug on unix/mac via
"" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
""     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"" or 
"" iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
""    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
"" on windows

call plug#begin('~/.vim/plugged')
    "" Vim-Session
    Plug 'xolox/vim-misc'
    Plug 'xolox/vim-session'

    "" Snippets
    Plug 'honza/vim-snippets'
    Plug 'mlaursen/vim-react-snippets'

    Plug 'Quramy/tsuquyomi', { 'do': 'npm -g install typecript' }
    Plug 'Shougo/vimproc.vim', { 'do': 'make' }
    Plug 'vim-syntastic/syntastic'
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'airblade/vim-gitgutter'
    Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
    Plug 'mxw/vim-jsx'
    Plug 'tasn/vim-tsx'
    Plug 'pangloss/vim-javascript'
    Plug 'junegunn/fzf.vim'
    Plug 'morhetz/gruvbox'
    Plug 'rhysd/open-pdf.vim'
    Plug 'wakatime/vim-wakatime'
    Plug 'prettier/vim-prettier', {'do': 'yarn install', 'branch': 'release/0.x'}
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'honza/vim-snippets'
    Plug 'dag/vim-fish'
    "*****************************************************************************
    "" Custom bundles
    "*****************************************************************************

    " c
    Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
    Plug 'ludwig/split-manpage.vim'


    " html
    "" HTML Bundle
    Plug 'hail2u/vim-css3-syntax'
    Plug 'gko/vim-coloresque'
    Plug 'tpope/vim-haml'
    Plug 'mattn/emmet-vim'


    " javascript
    "" Javascript Bundle
    Plug 'jelera/vim-javascript-syntax'


    " python
    "" Python Bundle
    Plug 'davidhalter/jedi-vim'
    Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}


    " rust
    " Vim racer
    Plug 'racer-rust/vim-racer'

    " Rust.vim
    Plug 'rust-lang/rust.vim'

    " Async.vim
    Plug 'prabirshrestha/async.vim'

    " Vim lsp
    Plug 'prabirshrestha/vim-lsp'

    " Asyncomplete.vim
    Plug 'prabirshrestha/asyncomplete.vim'
    
    " Asyncomplete lsp.vim
    Plug 'prabirshrestha/asyncomplete-lsp.vim'


    " typescript
    Plug 'leafgarland/typescript-vim'
    Plug 'HerringtonDarkholme/yats.vim'
    

    "*****************************************************************************
    "*****************************************************************************

call plug#end()


filetype plugin indent on
syntax on

set nocompatible
set nofoldenable
set visualbell
set t_vb=
set number
set cindent
set tabstop=2
set shiftwidth=2
set expandtab
set updatetime=300
set shortmess+=c
set signcolumn=yes
set t_8f=\[[38;2;%lu;%lu;%lum
set t_8b=\[[48;2;%lu;%lu;%lum
set termguicolors
set mouse=a
set whichwrap+=<,>,[,]
set hidden
set hlsearch
set incsearch
set ignorecase
set smartcase
set shell=/usr/local/bin/fish
set fileformats=unix,dos,mac
set ruler
set number
set mousemodel=popup
set t_Co=256
set guioptions=egmrti
"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
set smarttab
set relativenumber

let mapleader = ","

let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
let g:fzf_preview_window = 'right:60%'
nnoremap <c-p> :Files<cr>
let g:coc_global_extensions = ['coc-snippets', 'coc-pairs', 'coc-tsserver', 'coc-prettier', 'coc-json', 'coc-jedi', 'coc-emmet', 'coc-css']
let g:python3_host_prog='/usr/local/bin/python3'
let t:is_transparent = 1
let g:prettier#autoformat = 0
let g:NERDTreeChDirMode=2
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent= '<RightMouse>'
let g:NERDTreeShowHidden=1
let g:NERDTreeWinSize = 35
let g:NERDTreeWinPos = "right"
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
" vim-airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "ga"
let g:jedi#goto_definitions_command = "gdd"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0
" vim-airline
let g:airline#extensions#virtualenv#enabled = 1
" typescript
let g:yats_host_keyword = 1
" Syntax highlight
let python_highlight_all = 1
let g:tsuquyomi_shortest_import_path = 1


augroup fzf
  autocmd!
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END

autocmd StdinReadPre * let s:std_in=1
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
autocmd BufWritePre *.py, *.pyc !black %
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
\ if v:insertmode == 'i' |
\   silent execute '!echo -ne "\e[6 q"' | redraw! |
\ elseif v:insertmode == 'r' |
\   silent execute '!echo -ne "\e[4 q"' | redraw! |
\ endif
au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree

inoremap <silent><expr> <TAB>
    \ coc#refresh()

function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nnoremap <silent> K :call <SID>show_documentation()<CR>


noremap <leader>a ggVG
noremap <Leader>nn :NERDTreeToggle<cr>
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>
noremap y "*y
noremap p "*p
noremap x "*x
noremap X "*x
noremap Y "+y
noremap P "+p

map gn :bn<cr>
map gp :bp<cr>

cmap W w
cmap Q q

function! s:show_documentation()
if (index(['vim','help'], &filetype) >= 0)
  execute 'h '.expand('<cword>')
else
  call CocAction('doHover')
endif
endfunction

colorscheme gruvbox

