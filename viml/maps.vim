" Go to the beginning of the line in insert mode
inoremap <silent><C-a> <C-o>0
" Go to the ending of the line in insert mode
inoremap <silent><C-b> <C-o>$
" Paste from the system clipboard(in normal mode)
nnoremap <silent><leader>y "*y
" Paste from the system clipboard(in visual mode)
vnoremap <silent><leader>y "*y
" Cut from the system clipboard(in normal mode)
nnoremap <silent><leader>x "*x
" Cut from the system clipboard(in visual mode)
vnoremap <silent><leader>x "*x
" Paste from the system clipboard(in normal mode)
nnoremap <silent><leader>p "*p
" Paste from the system clipboard(in visual mode)
nnoremap <silent><leader>p "*p
" Select everything
nnoremap <silent><leader>a ggVG
" Delete a buffer
nnoremap <silent><leader>bd :bd<CR>
" Escape in terminal mode takes you to normal mode
tnoremap <silent><leader><Esc> <C-\><C-n>
" Create a new blank buffer
nnoremap <leader>gg :enew<CR>
" Toggle search highlight
nnoremap <silent> <C-C> :if (&hlsearch == 1) \| set nohlsearch \| else \| set hlsearch \| endif<cr>
" Do not make Q go to ex-mode
nnoremap Q <Nop>

" Wrap selection with '' 
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>
" Wrap selection with ""
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>
" Wrap selection with ()
vnoremap <leader>( <esc>`>a)<esc>`<i(<esc>
" Wrap selection with []
vnoremap <leader>[ <esc>`>a]<esc>`<i[<esc>
" Wrap selection with {}
vnoremap <leader>{ <esc>`>a}<esc>`<i{<esc>

" These are all terminal shorthands
" I've made them to recognize common typos
cnoreabbrev wq w<bar>bd
cnoreabbrev Wq w<bar>bd
cnoreabbrev WQ w<bar>bd
cnoreabbrev wqa1 wqa!
cnoreabbrev qa1 qa!
cnoreabbrev Qa qa
cnoreabbrev Wqa wqa
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev B buffer

" Change buffer sizes 
"
" Make buffer narrower
nnoremap <silent> <C-H> :vertical resize -4<CR>
" Make buffer wider
nnoremap <silent> <C-L> :vertical resize +4><CR>
" Make buffer shorter
nnoremap <silent> <C-J> :resize -4<CR>
" Make buffer longer
nnoremap <silent> <C-K> :resize +4<CR>

"Similar mappings for terminal mode{{{
tnoremap <silent> <C-H> :vertical resize -4<CR>
tnoremap <silent> <C-L> :vertical resize +4><CR>
tnoremap <silent> <C-J> :resize -4<CR>
tnoremap <silent> <C-K> :resize +4<CR>

" Create/Toggle a terminal to the bottom
nnoremap <silent><leader>` :call ChooseTerm("term-slider", 1)<CR>
tnoremap <silent><leader>` <C-\><C-n>:call ChooseTerm("term-slider", 1)<CR>
" Create/Toggle a terminal in a buffer 
nnoremap <silent><leader><CR> :call ChooseTerm("term-pane", 0)<CR>
tnoremap <silent><leader><CR> <C-\><C-n>:call ChooseTerm("term-pane", 0)<CR>

" Terminal Toggle
function! ChooseTerm(termname, slider)
    let pane = bufwinnr(a:termname)
    let buf = bufexists(a:termname)
    if pane > 0
        " pane is visible
        if a:slider > 0
            :exe pane . "wincmd c"
        else
            :exe "e #" 
        endif
    elseif buf > 0
        " buffer is not in pane
        if a:slider
            :exe "botright split"
        endif
        :exe "buffer " . a:termname
    else
        " buffer is not loaded, create
        if a:slider
            :exe "botright split"
        endif
        :terminal
        :exe "f " a:termname
    endif
endfunction

" Goto private config
nnoremap <silent><leader>kc :e ~/.config/nvim/lua/kyotorc/init.lua<CR>

" Telescope
" Fuzzy file finder
nnoremap <silent><leader>ff :Telescope find_files hidden=true<CR>
" Fuzzy buffer finder
nnoremap <silent><leader>fb :Telescope buffers<CR>
" Fuzzy help-tages finder
nnoremap <silent><leader>fh :Telescope help_tags<CR>
" Search with ripgrep
nnoremap <silent><leader>fi :Telescope live_grep<CR>
" Fuzzy git status
nnoremap <silent><leader>fg :Telescope git_status<CR>
" Fuzzy old-files finder
nnoremap <silent><leader>fo :Telescope oldfiles<CR>

" Symobols Finder
nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
" Show code actions
nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
" Show code actions for selection
vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>
" Show hovering documentation
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
" Scroll down in lspsaga menus
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" Scroll up in lspsaga menus
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
" Show signature help(imo not thaat useful)
nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
" Rename symbols
nnoremap <silent>gr <cmd>lua require('lspsaga.rename').rename()<CR>
" Preview definition
nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
" Show suggestions/errors/warnings for the line
nnoremap <silent><leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>
nnoremap <silent><leader>cc <cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>
" Jump to the next diagnostic suggestion
nnoremap <silent> ]e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>
" Jump to the previous diagnostic suggestion
nnoremap <silent> [e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>

" Jump to definition
nnoremap <silent> gD <cmd>lua vim.lsp.buf.definition()<CR>

" Toggle error menu
nnoremap <silent><leader>h :TroubleToggle<CR>
" Show symbols outline
nnoremap <silent><leader>so :SymbolsOutline<CR>
" Show blame for line
nnoremap <silent><leader>bb :Gitsigns toggle_current_line_blame<CR>

" Toggle comment for line
nnoremap <silent><leader>/ :Commentary<CR>
" Toggle comment for selections
vnoremap <silent><leader>/ :Commentary<CR>

function! ToggleNvimTree()
   if exists(":NvimTreeToggle") == 0
     " lazy load nvim-tree
     silent! packadd nvim-tree.lua
   endif

   NvimTreeToggle
 endfunction

" Call nvim-tree lazy load function
nnoremap <silent> <leader>n :call ToggleNvimTree()<CR>

"Open lazygit
nnoremap <silent> <leader>lg :LazyGit<CR>

" Wilder Search
cmap <expr> <Tab> wilder#in_context() ? wilder#next() : "\<Tab>"
" Wilder iterate through results
cmap <expr> <S-Tab> wilder#in_context() ? wilder#previous() : "\<S-Tab>"

" Debug keybindings
nnoremap <silent><leader>db <cmd>lua require"dap".toggle_breakpoint()<CR>
nnoremap <silent><leader>dc <cmd>lua require"dap".continue()<CR>
nnoremap <silent><leader>dsv <cmd>lua require"dap".step_out()<CR>
nnoremap <silent><leader>dsi <cmd>lua require"dap".step_into()<CR>
nnoremap <silent><leader>dso <cmd>lua require"dap".step_over()<CR>
nnoremap <silent><leader>dsc <cmd>lua require"dap.ui.variables".scopes()<CR>
nnoremap <silent><leader>dhh <cmd>lua require"dap.ui.variables".hover()<CR>
nnoremap <silent><leader>dhv <cmd>lua require"dap.ui.variables".visual_hover()<CR>
nnoremap <silent><leader>duf <cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>
nnoremap <silent><leader>dsbr <cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>
nnoremap <silent><leader>dsbm <cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>
nnoremap <silent><leader>dr <cmd>lua require"dap".repl.open()<CR>
nnoremap <silent><leader>dx <cmd>lua require"dap".close() require"dapui".close()<CR>

command LoadPacker lua require 'pluginList'

nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>


nnoremap <silent> gb :BufferLinePick<CR>
