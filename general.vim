let g:python3_host_prog='/usr/local/bin/python3'
let g:indentLine_fileTypeExclude = ['dashboard', 'coc-explorer']
set guifont=FiraCode\ Nerd\ Font\ Mono:h17
set guioptions-=m
set guioptions-=T
set guioptions-=rd
set guioptions-=L
set nofoldenable
set hidden
syntax on
set termguicolors
set autoread
set encoding=utf-8
set pumheight=10
set fileencoding=utf-8
set iskeyword+=-
set mouse=a
set splitbelow
set splitright
set wildmenu
set wildmode=longest:full,full
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set smartindent
set autoindent
set background=dark
set nobackup
set nowritebackup
set updatetime=300
set timeoutlen=500
set laststatus=2
set noswapfile
set whichwrap+=<,>,[,]
set updatetime=300
set backspace=indent,eol,start
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab
set relativenumber
set nu rnu

source ~/.config/nvim/mappings.vim

augroup terminalsettings
	autocmd!
	if has('nvim')
		autocmd TermOpen *
			\ setlocal nonumber norelativenumber |
			\ startinsert
	endif
augroup end

colorscheme tokyonight
