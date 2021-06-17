autocmd BufDelete * if empty(filter(tabpagebuflist(), '!buflisted(v:val)')) | Startify | endif
au FileType css setl ofu=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
augroup ProjectDrawer
  autocmd!
augroup END
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
autocmd BufRead,BufNewFile *.md,*.wiki,*.txt setlocal spell
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

