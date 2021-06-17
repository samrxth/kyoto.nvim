let s:default_terminal = {
  \ 'loaded': v:null,
  \ 'termbufferid': v:null
\ }

""
" Preserve the alternate_buffer of the current window when opening and closing
" the terminal. Default is 1 (true)
let g:preserve_alternate_buffer = get(g:, 'preserve_alternate_buffer', 1)

""
" enter insert mode automatically when given focus. Uses BufEnter event
let g:auto_start_insert = get(g:, 'auto_start_insert', 0)

""
" start in insert mode when you open the terminal. Uses BufWinEnter event
let g:open_in_insert_mode = get(g:, 'open_in_insert_mode', 1)

""
" @deprecated Use nvim_toggle_terminal#Toggle or the provided commands instead
" Toggle terminal buffer or create new one if there is none.
function! nvim_toggle_terminal#ToggleTerminal() abort
  call nvim_toggle_terminal#Toggle("g:terminal")
endfunction

""
" @public
" Toggle terminal buffer associated to `terminal_ref`. It will have the same scope as the variable.
function! nvim_toggle_terminal#Toggle(terminal_ref) abort
  if !has('nvim')
    return v:false
  endif

  if !exists(a:terminal_ref)
    let {a:terminal_ref} = copy(s:default_terminal)
  endif

  let s:tr = a:terminal_ref
  function! {a:terminal_ref}.on_exit(jobid, data, event)
    silent execute 'keepjumps buffer' w:originbufferid
    let {s:tr} = copy(s:default_terminal)
  endfunction

  " If Terminal not open
  if !get({a:terminal_ref}, "loaded")
    let w:originbufferid = exists("w:originbufferid") ? w:originbufferid : bufnr()
    let w:alternate_buffer = exists("w:alternate_buffer") ? w:alternate_buffer : @#

    keepjumps enew
    call termopen(&shell, {a:terminal_ref})
    set bufhidden=hide
    set nobuflisted
    let {a:terminal_ref}.loaded = v:true
    let {a:terminal_ref}.termbufferid = bufnr('')

    return v:true
  endif

  if get({a:terminal_ref}, "termbufferid") ==# bufnr()
    " Go back to origin buffer if current buffer is terminal.
    if exists("w:originbufferid")
      silent execute 'keepjumps buffer' w:originbufferid
      if g:preserve_alternate_buffer && w:alternate_buffer !=? ''
        let @# = w:alternate_buffer
      endif
      unlet w:alternate_buffer
      unlet w:originbufferid
    else
      echo "There is no buffer to go back to!"
    endif
  else
    " Go to terminal buffer if is loaded but not current buffer
    let w:alternate_buffer = exists("w:alternate_buffer") ? w:alternate_buffer : @#
    let w:originbufferid = exists("w:originbufferid") ? w:originbufferid : bufnr()
    let l:id = get({a:terminal_ref}, "termbufferid")
    silent execute 'keepjumps buffer' l:id
  endif
endfunction

function! nvim_toggle_terminal#TerminalOptions()
  setlocal listchars= nonumber norelativenumber
  if g:auto_start_insert
    silent au BufEnter <buffer> startinsert!
    silent au BufLeave <buffer> stopinsert!
  endif
  if g:open_in_insert_mode
    silent au BufWinEnter <buffer> startinsert!
    startinsert!
  endif
endfunction
