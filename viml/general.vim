augroup terminalsettings
  autocmd!
  if has('nvim')
    autocmd TermOpen *
            \ setlocal nonumber norelativenumber |
            \ startinsert
  endif
augroup end

set nu rnu
