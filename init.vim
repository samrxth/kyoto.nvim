"      .__                       
"___  _|__| ____________   ____  
"\  \/ /  |/     \_  __ \_/ ___\ 
" \   /|  |  Y Y  \  | \/\  \___ 
"  \_/ |__|__|_|  /__|    \___  >
"               \/            \/
let mapleader = ","

call plug#begin('~/.vim/plugged')
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'airblade/vim-gitgutter'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'scrooloose/nerdtree'
    Plug 'tsony-tsonev/nerdtree-git-plugin'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'ryanoasis/vim-devicons'
    Plug 'airblade/vim-gitgutter'
    Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
    Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
    Plug 'leafgarland/typescript-vim'
    Plug 'HerringtonDarkholme/yats.vim'
    Plug 'wakatime/vim-wakatime'
    Plug 'tomasiser/vim-code-dark'
    Plug 'vimwiki/vimwiki'
call plug#end()

nnoremap y "*y
vnoremap y "*y
nnoremap x "*x
vnoremap x "*x
nnoremap p "*p
vnoremap p "*p
inoremap jk <ESC>
nnoremap <leader>a ggVG
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
map gn :bn<cr>
map gp :bp<cr>
cmap W w
cmap Q q


let g:python3_host_prog='/usr/local/bin/python3'
let g:NERDTreeWinPos = "right"
let g:NERDTreeIgnore = ['^node_modules$']
let g:NERDTreeShowHidden=1
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


set number
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
" always uses spaces instead of tab characters
set mouse=a
set whichwrap+=<,>,[,]
set guifont=RobotoMono\ Nerd\ Font\ Mono:h14


colorscheme codedark


au VimEnter *  NERDTree

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

set hidden
set updatetime=300

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
