let mapleader = ","


set number
set hidden
set nobackup
set background=dark
set tabstop=2
set shiftwidth=2
set expandtab
set conceallevel=1
set cursorline
set updatetime=300
set nocompatible
set encoding=UTF-8
set mouse=a
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
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
autocmd BufRead,BufNewFile *.md,*.wiki,*.txt setlocal spell


syntax enable 

call plug#begin()
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
  Plug 'sheerun/vim-polyglot'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/playground'
  Plug 'mattn/emmet-vim'
  Plug 'mattn/webapi-vim'
  Plug 'sainnhe/gruvbox-material'
  Plug 'leafgarland/typescript-vim'
  Plug 'mhinz/vim-startify'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'Yggdroot/indentLine'
  Plug 'ryanoasis/vim-devicons'
  Plug 'kyazdani42/nvim-web-devicons' " for file icons
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'junegunn/goyo.vim'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'pangloss/vim-javascript'
  Plug 'tomasiser/vim-code-dark'
  Plug 'tarebyte/nvim-base16'
  Plug 'akinsho/nvim-bufferline.lua'
  Plug 'norcalli/nvim.lua'
  Plug 'norcalli/nvim-base16.lua'
  Plug 'Th3Whit3Wolf/one-nvim'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'shaunsingh/nord.nvim'
  Plug 'hardcoreplayers/spaceline.vim'
  Plug 'majutsushi/tagbar'
  Plug 'neovim/nvim-lspconfig'
  Plug 'onsails/lspkind-nvim'
  Plug 'vimwiki/vimwiki'
call plug#end()

let g:spaceline_colorscheme = 'nord'
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15
let g:tagbar_winsize = 8
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
            \ {'path': '~/Desktop/ECONOMICS/Notes/Chapter2-Notes', },
            \ {'path': '~/Desktop/ECONOMICS/Notes/Chapter3-Notes', 'syntax': 'markdown', 'ext': '.md', 'custom_wiki2html': '~/go/bin/vimwiki-godown',},
            \ {'path': '~/Desktop/ECONOMICS/Notes/EcoNotes'},
            \ {'path': '~/Desktop/Comp-Sci/Notes/Chapter1', 'syntax': 'markdown', 'ext': '.md', 'custom_wiki2html': '~/go/bin/vimwiki-godown',},
            \ {'path': '~/Desktop/German/DSD/'},
            \]


filetype plugin on
set omnifunc=syntaxcomplete#Complete
au FileType php setl ofu=phpcomplete#CompletePHP
au FileType ruby,eruby setl ofu=rubycomplete#Complete
au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
au FileType c setl ofu=ccomplete#CompleteCpp
au FileType css setl ofu=csscomplete#CompleteCSS
au VimEnter * NvimTreeOpen
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
augroup ProjectDrawer
  autocmd!
augroup END

source ~/.config/nvim/ui.vim
source ~/.config/nvim/maps.vim


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
  \ 'coc-react-refactor',
  \ ]


nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
