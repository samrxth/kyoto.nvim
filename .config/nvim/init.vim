let mapleader = ","

call plug#begin('~/.vim/plugged')
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'airblade/vim-gitgutter'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tpope/vim-eunuch'
    Plug 'airblade/vim-gitgutter'
    Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
    Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
    Plug 'leafgarland/typescript-vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'HerringtonDarkholme/yats.vim'
    Plug 'wincent/terminus'
    Plug 'francoiscabrol/ranger.vim'
    "" bclose is a ranger dependency for nvim
    Plug 'rbgrouleff/bclose.vim'
    Plug 'wakatime/vim-wakatime'
    Plug 'tomasiser/vim-code-dark'
    Plug 'vimwiki/vimwiki'
call plug#end()

nnoremap <Leader>nn :NERDTreeClose<CR>:NERDTreeCWD<CR>
nnoremap y "*y
vnoremap y "*y
nnoremap x "*x
vnoremap x "*x
nnoremap p "*p
vnoremap p "*p
inoremap jk <ESC>
nnoremap <leader>a ggVG
nnoremap <D-v> "*p
nnoremap <D-c> "*y
nnoremap <D-x> "*x
inoremap <D-v> <esc>:set paste<cr>a<c-r>=getreg('+')<cr><esc>:set nopaste<cr>mi`[=`]`ia
inoremap <expr> <cr> getline(".")[col(".")-2:col(".")-1]=="{}" ? "<cr><esc>O" : "<cr>"
nnoremap <Leader>f :FZF<CR>


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

map gn :bn<cr>
map gp :bp<cr>

let g:prettier#quickfix_enabled = 0
let g:prettier#quickfix_auto_focus = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
let g:airline_theme = 'codedark'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:vimwiki_list = [{'path':'~/Documents/vimwiki'},
            \ {'path': '~/Desktop/ECONOMICS/Notes/Chapter1-Notes'},
            \ {'path': '~/Desktop/ECONOMICS/Notes/Chapter2-Notes'},
            \ {'path': '~/Desktop/ECONOMICS/Notes/EcoNotes'},
            \ {'path': '~/Desktop/German/DSD/'},
            \]

set number
set smarttab
set cindent
set noswapfile
set tabstop=2
set shiftwidth=2
" always uses spaces instead of tab characters
set mouse=a
set whichwrap+=<,>,[,]
set guifont=RobotoMono\ Nerd\ Font\ Mono:h14
set hidden
set updatetime=300
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast
set nocompatible
set wildmode=longest,list,full
set wildmenu
"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overridden by autocmd rules
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab
"" Enable hidden buffers
set hidden
"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set fileformats=unix,dos,mac

hi StatusLine guifg=#282c34 guifg=#abb2bf
colorscheme codedark

cnoreabbrev q bd
cnoreabbrev wq w<bar>bd
cmap W w
cmap Q q


"coc.nvim configurations
command! -nargs=0 Format :call CocAction('format')
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-emmet',
  \ ]


nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
