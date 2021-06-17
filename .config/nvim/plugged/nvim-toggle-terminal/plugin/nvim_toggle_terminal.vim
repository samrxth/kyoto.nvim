au TermOpen * call nvim_toggle_terminal#TerminalOptions()

""
" Toggles a terminal which is the same shell instance regardless of where it
" is called
command! ToggleTerminal call nvim_toggle_terminal#ToggleTerminal()

""
" Toggles a tab specific terminal instance. It will a have different shell session
" for each tab
command! ToggleTabTerminal call nvim_toggle_terminal#Toggle('t:terminal')

""
" Toggles a window specific terminal instance. It will have a different shell
" session for each window
command! ToggleWindowTerminal call nvim_toggle_terminal#Toggle('w:terminal')
