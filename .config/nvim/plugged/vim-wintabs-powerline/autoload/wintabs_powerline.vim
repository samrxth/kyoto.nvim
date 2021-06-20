function! wintabs_powerline#init()
  let g:wintabs_renderers = {
        \'buffer': function('wintabs_powerline#buffer'),
        \'buffer_sep': function('wintabs_powerline#buffer_sep'),
        \'tab': function('wintabs_powerline#tab'),
        \'tab_sep': function('wintabs_powerline#tab_sep'),
        \'left_arrow': function('wintabs_powerline#left_arrow'),
        \'right_arrow': function('wintabs_powerline#right_arrow'),
        \'line_sep': function('wintabs_powerline#line_sep'),
        \'padding': function('wintabs_powerline#padding'),
        \}

  augroup wintabs_powerline_on_colorscheme
    autocmd!
    autocmd ColorScheme,VimEnter * call s:on_colorscheme()
  augroup END
  call s:on_colorscheme()
endfunction

function! wintabs_powerline#buffer(bufnr, config)
  let label = wintabs#renderers#buf_label(a:bufnr, a:config)
  let highlight = a:config.is_active ? 'WintabsActive' : 'WintabsInactive'
  let highlight = s:maybe_nc(highlight, a:config)
  return { 'label': label, 'highlight': highlight }
endfunction

function! wintabs_powerline#buffer_sep(config)
  if a:config.is_leftmost
    return { 'label': '', 'highlight': '' }
  endif

  let highlight = 'WintabsInactive'
  if a:config.is_active && a:config.is_left
    let highlight = 'WintabsInactiveSepActive'
  elseif a:config.is_active && a:config.is_right && !a:config.is_rightmost
    let highlight = 'WintabsActiveSepInactive'
  elseif a:config.is_active && a:config.is_rightmost
    let highlight = 'WintabsActiveSepEmpty'
  elseif !a:config.is_active && a:config.is_rightmost
    let highlight = 'WintabsInactiveSepEmpty'
  endif

  let highlight = s:maybe_nc(highlight, a:config)
  let is_transitional = has_key(s:sep_is_transitional, highlight)
        \? s:sep_is_transitional[highlight]
        \: 0
  let label = is_transitional
        \? g:wintabs_powerline_sep_buffer_transition
        \: g:wintabs_powerline_sep_buffer
  return { 'label': label, 'highlight': highlight }
endfunction

function! wintabs_powerline#tab(tabnr, config)
  let label = ' '.wintabs#renderers#tab_label(a:tabnr).' '
  let highlight = a:config.is_active ? 'WintabsActive' : 'WintabsInactive'
  let highlight = s:maybe_nc(highlight, a:config)
  return { 'label': label, 'highlight': highlight }
endfunction

function! wintabs_powerline#tab_sep(config)
  if a:config.is_rightmost
    return { 'label': '', 'highlight': '' }
  endif

  let highlight = 'WintabsInactive'
  if a:config.is_active && a:config.is_right
    let highlight = 'WintabsInactiveSepActive'
  elseif a:config.is_active && a:config.is_left && !a:config.is_leftmost
    let highlight = 'WintabsActiveSepInactive'
  elseif a:config.is_active && a:config.is_leftmost
    let highlight = 'WintabsActiveSepEmpty'
  elseif !a:config.is_active && a:config.is_leftmost
    let highlight = 'WintabsInactiveSepEmpty'
  endif

  let highlight = s:maybe_nc(highlight, a:config)
  let is_transitional = has_key(s:sep_is_transitional, highlight)
        \? s:sep_is_transitional[highlight]
        \: 0
  let label = is_transitional
        \? g:wintabs_powerline_sep_tab_transition
        \: g:wintabs_powerline_sep_tab
  return { 'label': label, 'highlight': highlight }
endfunction

function! wintabs_powerline#left_arrow()
  return {
        \'type': 'left_arrow',
        \'label': g:wintabs_powerline_arrow_left,
        \'highlight': 'WintabsArrow',
        \}
endfunction

function! wintabs_powerline#right_arrow()
  return {
        \'type': 'right_arrow',
        \'label': g:wintabs_powerline_arrow_right,
        \'highlight': 'WintabsArrow',
        \}
endfunction

function! wintabs_powerline#line_sep()
  return {
        \'type': 'sep',
        \'label': '  ',
        \'highlight': 'WintabsEmpty',
        \}
endfunction

function! wintabs_powerline#padding(len)
  return {
        \'type': 'sep',
        \'label': repeat(' ', a:len),
        \'highlight': 'WintabsEmpty',
        \}
endfunction

function! s:on_colorscheme()
  let s:sep_is_transitional = {}
  call s:highlight('WintabsInactiveSepActive', 'WintabsInactive', 'WintabsActive')
  call s:highlight('WintabsActiveSepInactive', 'WintabsActive', 'WintabsInactive')
  call s:highlight('WintabsActiveSepEmpty', 'WintabsActive', 'WintabsEmpty')
  call s:highlight('WintabsInactiveSepEmpty', 'WintabsInactive', 'WintabsEmpty')
  call s:highlight('WintabsInactiveSepActiveNC', 'WintabsInactiveNC', 'WintabsActiveNC')
  call s:highlight('WintabsActiveSepInactiveNC', 'WintabsActiveNC', 'WintabsInactiveNC')
  call s:highlight('WintabsActiveSepEmptyNC', 'WintabsActiveNC', 'WintabsEmpty')
  call s:highlight('WintabsInactiveSepEmptyNC', 'WintabsInactiveNC', 'WintabsEmpty')
endfunction

function! s:highlight(higroup, fg_higroup, bg_higroup)
  let fg_color = s:get_color(a:fg_higroup, 'bg')
  let bg_color = s:get_color(a:bg_higroup, 'bg')
  let is_transitional = fg_color != bg_color
  if !is_transitional
    let fg_color = s:get_color(a:fg_higroup, 'fg')
  endif
  let s:sep_is_transitional[a:higroup] = is_transitional

  let cmd = 'highlight! '.a:higroup
  for mode in ['gui', 'cterm']
    let cmd = cmd.' '.mode.'fg='.fg_color[mode]
    let cmd = cmd.' '.mode.'bg='.bg_color[mode]
  endfor
  execute cmd
endfunction

function! s:get_color(higroup, type)
  let color = {}
  for mode in ['gui', 'cterm']
    let value = synIDattr(synIDtrans(hlID(a:higroup)), a:type, mode)
    if empty(value)
      if a:higroup ==? 'Normal'
        let value = a:type == 'fg' ? 'Black' : 'White'
      else
        let value = s:get_color('Normal', a:type)[mode]
      endif
    endif
    let color[mode] = value
  endfor
  return color
endfunction

function! s:maybe_nc(higroup, config)
  let is_nc = has_key(a:config, 'is_active_window') && !a:config.is_active_window
  let higroup = is_nc ? a:higroup.'NC' : a:higroup
  " echom higroup
  return higroup
endfunction
