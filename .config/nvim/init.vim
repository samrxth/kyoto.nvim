let mapleader = ","

call plug#begin('~/.vim/plugged')
    Plug 'nvim-lua/completion-nvim'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-eunuch'
    Plug 'airblade/vim-gitgutter'
    Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
    Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
    Plug 'leafgarland/typescript-vim'
    Plug 'ghifarit53/tokyonight-vim'
    Plug 'HerringtonDarkholme/yats.vim'
    Plug 'francoiscabrol/ranger.vim'
    "" bclose is a ranger dependency for nvim
    Plug 'rbgrouleff/bclose.vim'
    Plug 'wakatime/vim-wakatime'
    Plug 'vimwiki/vimwiki'
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'
    Plug 'voldikss/vim-floaterm'
    Plug 'Quramy/tsuquyomi'
call plug#end()

highlight clear
if exists("syntax_on")
  syntax reset
endif

set background=dark
let g:colors_name = "silverhand"

function! HighlightFor(group, ...)
  execute "hi ".a:group
        \ ." guifg=".a:1
        \ ." guibg=".a:2
        \ ." gui=".a:3
endfunction

nnoremap y "*y
vnoremap y "*y
nnoremap x "*x
vnoremap x "*x
nnoremap p "*p
vnoremap p "*p
inoremap jk <ESC>
nnoremap <leader>a ggVG
nnoremap <D-v> "*p
nnoremap <leader>t :FloatermNew<CR>
nnoremap <D-c> "*y
nnoremap <D-x> "*x
inoremap <D-v> <esc>:set paste<cr>a<c-r>=getreg('+')<cr><esc>:set nopaste<cr>mi`[=`]`ia
inoremap <expr> <cr> getline(".")[col(".")-2:col(".")-1]=="{}" ? "<cr><esc>O" : "<cr>"
nnoremap <Leader>f :FZF<CR>
map <Up> gk
map <Down> gj


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


let g:tokyonight_style = 'storm'
let g:prettier#quickfix_enabled = 0
let g:prettier#quickfix_auto_focus = 0
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:tsuquyomi_shortest_import_path = 1
let g:vimwiki_list = [{'path':'~/Documents/vimwiki'},
            \ {'path': '~/Desktop/ECONOMICS/Notes/Chapter1-Notes'},
            \ {'path': '~/Desktop/ECONOMICS/Notes/Chapter2-Notes', },
            \ {'path': '~/Desktop/ECONOMICS/Notes/Chapter3-Notes', 'syntax': 'markdown', 'ext': '.md', 'custom_wiki2html': '~/go/bin/vimwiki-godown',},
            \ {'path': '~/Desktop/ECONOMICS/Notes/EcoNotes'},
            \ {'path': '~/Desktop/Comp-Sci/Notes/Chapter1', 'syntax': 'markdown', 'ext': '.md', 'custom_wiki2html': '~/go/bin/vimwiki-godown',},
            \ {'path': '~/Desktop/German/DSD/'},
            \]

set number
set noshowmode
set noruler
set laststatus=0
set noshowcmd
set cmdheight=1
set smarttab
set cindent
set noswapfile
set tabstop=2
set shiftwidth=2
" always uses spaces instead of tab characters
set mouse=a
set whichwrap+=<,>,[,]
set hidden
set updatetime=300
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set nocompatible
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

set background=dark
colorscheme tokyonight

cnoreabbrev q bd
cnoreabbrev wq w<bar>bd
cnoreabbrev W w
cnoreabbrev Q q

autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
autocmd BufRead,BufNewFile *.md,*.wiki,*.txt setlocal spell

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
