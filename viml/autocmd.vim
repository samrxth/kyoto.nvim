" Turn off line numbers and start insert mode in terminal
autocmd TermOpen * setlocal nonumber norelativenumber | startinsert

" Set indenting for python
au BufNewFile,BufRead *.py
    \ setlocal tabstop=4
    \ setlocal softtabstop=4
    \ setlocal shiftwidth=4
    \ setlocal textwidth=79
    \ setlocal expandtab
    \ setlocal autoindent
    \ setlocal fileformat=unix

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

call wilder#enable_cmdline_enter()
call wilder#set_option('modes', ['/', '?'])
