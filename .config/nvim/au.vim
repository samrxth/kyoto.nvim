augroup python_settings                         " Custom settings: Python-like
    autocmd!
    autocmd FileType py
                 \ setlocal shiftwidth=4 
                 \          softtabstop=4
augroup END
autocmd BufDelete * if empty(filter(tabpagebuflist(), '!buflisted(v:val)')) | Startify | endif
augroup ProjectDrawer
  autocmd!
augroup END
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
autocmd BufRead,BufNewFile *.md,*.wiki,*.txt setlocal spell
