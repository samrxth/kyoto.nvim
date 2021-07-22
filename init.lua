require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'lambdalisue/fern.vim'
  use 'lambdalisue/nerdfont.vim'
  use 'lambdalisue/fern-renderer-nerdfont.vim'
  use 'folke/tokyonight.nvim'
end)
local opt = vim.opt
local g = vim.g

g.kyoto_nvim_tree_show_git = false
g.mapleader = " "

vim.g.tokyonight_style = "storm"

opt.ruler = false
opt.hidden = true
opt.ignorecase = true
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.cul = true
opt.mouse = "a"
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.updatetime = 250 -- update interval for gitsigns
opt.timeoutlen = 400
opt.relativenumber = true
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.background = "dark"

vim.cmd [[
nnoremap <leader>nn :Fern -drawer .<CR>
let g:fern#renderer = "nerdfont"
function! Init_fern() abort
  nmap <buffer> <Plug>(fern-action-open) <Plug>(fern-action-open:select)
  nmap <buffer> <CR> <Plug>(fern-action-open-or-expand)
  nmap <buffer> d <Plug>(fern-action-remove)
  setlocal nonumber norelativenumber 
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call Init_fern()
augroup END
colorscheme tokyonight
]]
