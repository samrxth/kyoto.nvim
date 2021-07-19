command! Conf :e ~/.config/nvim/init.vim
command! Cdconf :cd ~/.config/nvim

inoremap <C-a> <C-o>0
inoremap <C-b> <C-o>$
nnoremap <leader>y "*y
vnoremap <leader>y "*y
nnoremap <leader>x "*x
vnoremap <leader>x "*x
nnoremap <leader>p "*p
nnoremap gn :bn<CR>
nnoremap gp :bp<CR>
nnoremap <leader>a ggVG
nnoremap bd :bd<CR>
tnoremap <Esc> <C-\><C-n>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

xmap <leader>ha  <Plug>(coc-codeaction-selected)<CR>
nmap <leader>ha  <Plug>(coc-codeaction-selected)<CR>

nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> gd :call CocAction('jumpDefinition', 'drop')<CR>
nnoremap <silent> gy :call CocAction('jumpTypeDefinition', 'drop')<CR>

cnoreabbrev wq w<bar>bd
cnoreabbrev Wq w<bar>bd
cnoreabbrev WQ w<bar>bd
cnoreabbrev Qa qa
cnoreabbrev Wqa wqa
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev B buffer
nnoremap Q <Nop>
if bufwinnr(1)
  nnoremap <silent> <C-H> :vertical resize -4<CR>
  nnoremap <silent> <C-L> :vertical resize +4><CR>
  nnoremap <silent> <C-J> :resize -4<CR>
  nnoremap <silent> <C-K> :resize +4<CR>
  tnoremap <silent> <C-H> :vertical resize -4<CR>
  tnoremap <silent> <C-L> :vertical resize +4><CR>
  tnoremap <silent> <C-J> :resize -4<CR>
  tnoremap <silent> <C-K> :resize +4<CR>
endif

nnoremap <leader>dc :e ~/.config/nvim/init.lua<CR>
nnoremap <leader>ff :Telescope find_files hidden=true<CR>
nnoremap <leader>fb :Telescope buffers<CR>
nnoremap <leader>fh :Telescope help_tags<CR>
nnoremap <leader>fi :Telescope live_grep<CR>
nnoremap <leader>fg :Telescope git_status<CR>
nnoremap <leader>fo :Telescope oldfiles<CR>
nnoremap <leader>nn :Telescope file_browser<CR>

function! Save_popup()
  let option_num = input("  1. Save your code and format with Prettier  \n  2. Save your code \n  3. Cancel\nChoose your option: ")
  if option_num == '1'
    execute "w"
    execute "PrettierAsync"
  elseif option_num == '2'
    execute 'w'
  endif
endfunction

nnoremap <leader>og :call Save_popup()<CR>
map <Up> <NOP>
map <Down> <NOP>
map <Left> <NOP>
map <Right> <NOP>

nnoremap <leader>` :call ChooseTerm("term-slider", 1)<CR>
nnoremap <leader><CR> :call ChooseTerm("term-pane", 0)<CR>
nnoremap <leader>vv :Vista coc<CR>
 
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

nnoremap <leader>cd :CocDiagnostics<CR>
nnoremap <leader>bb :Gitsigns toggle_current_line_blame<CR>
