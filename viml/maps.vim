" general {{{
    inoremap <silent><C-a> <C-o>0
    inoremap <silent><C-b> <C-o>$
    nnoremap <silent><leader>y "*y
    vnoremap <silent><leader>y "*y
    nnoremap <silent><leader>x "*x
    vnoremap <silent><leader>x "*x
    nnoremap <silent><leader>p "*p
    nnoremap <silent>gn :bn<CR>
    nnoremap <silent>gp :bp<CR>
    nnoremap <silent><leader>a ggVG
    nnoremap <silent>bd :bd<CR>
    tnoremap <silent><Esc> <C-\><C-n>
    nnoremap <leader>en :enew<CR>

    nnoremap <silent> <C-H> :vertical resize -4<CR>
    nnoremap <silent> <C-L> :vertical resize +4><CR>
    nnoremap <silent> <C-J> :resize -4<CR>
    nnoremap <silent> <C-K> :resize +4<CR>
    tnoremap <silent> <C-H> :vertical resize -4<CR>
    tnoremap <silent> <C-L> :vertical resize +4><CR>
    tnoremap <silent> <C-J> :resize -4<CR>
    tnoremap <silent> <C-K> :resize +4<CR>

    nnoremap <silent><leader>dc :e ~/.config/nvim/lua/kyotorc.lua<CR>

    map <silent><Up> <NOP>
    map <silent><Down> <NOP>
    map <silent><Left> <NOP>
    map <silent><Right> <NOP>

    cnoreabbrev wq w<bar>bd
    cnoreabbrev Wq w<bar>bd
    cnoreabbrev WQ w<bar>bd
    cnoreabbrev Qa qa
    cnoreabbrev Wqa wqa
    cnoreabbrev W w
    cnoreabbrev Q q
    cnoreabbrev B buffer
    nnoremap Q <Nop>
"}}}


"" NvimTree {{{
    function! ToggleNvimTree()
      if exists(":NvimTreeToggle") == 0
        silent! packadd nvim-tree.lua
      endif

      NvimTreeToggle
    endfunction

    nnoremap <silent> <leader>nn :call ToggleNvimTree()<CR>
"}}}



" Telescope {{{
    nnoremap <silent><leader>ff :Telescope find_files hidden=true<CR>
    nnoremap <silent><leader>fb :Telescope buffers<CR>
    nnoremap <silent><leader>fh :Telescope help_tags<CR>
    nnoremap <silent><leader>fi :Telescope live_grep<CR>
    nnoremap <silent><leader>fg :Telescope git_status<CR>
    nnoremap <silent><leader>fo :Telescope oldfiles<CR>
    nnoremap <silent><leader>fn :Telescope file_browser hidden=true<CR>
"}}}
 

" terminals {{{
    nnoremap <leader>` :call ChooseTerm("term-slider", 1)<CR>
    nnoremap <leader><CR> :call ChooseTerm("term-pane", 0)<CR>
    nnoremap <leader>to :lua require('lspsaga.floaterm').open_float_terminal()<CR>
    nnoremap <leader>tc :lua require('lspsaga.floaterm').close_float_terminal()<CR>

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
"}}}

" compe completion {{{
    inoremap <silent><expr> <CR>      compe#confirm('<CR>')
    inoremap <silent><expr> <C-e>     compe#close('<C-e>')
    inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
    inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
    inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"}}}


"Lspsaga {{{
    nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
    nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
    vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>
    nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
    nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
    nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
    nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
    nnoremap <silent>gr <cmd>lua require('lspsaga.rename').rename()<CR>
    nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
    nnoremap <silent><leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>
    nnoremap <silent><leader>cc <cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>
    nnoremap <silent> [e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
    nnoremap <silent> ]e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>
"}}}


"misc {{{
    nnoremap <silent><leader>h :TroubleToggle<CR>
    nnoremap <silent><leader>so :SymbolsOutline<CR>
    nnoremap <silent><leader>bb :Gitsigns toggle_current_line_blame<CR>

    nnoremap <leader>C :Commentary<CR>
    vnoremap <leader>C :Commentary<CR>
"}}}
