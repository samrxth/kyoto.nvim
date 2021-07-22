require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'lambdalisue/fern.vim'
  use 'lambdalisue/nerdfont.vim'
  use "onsails/lspkind-nvim"
  use "kyazdani42/nvim-tree.lua"
  use "glepnir/lspsaga.nvim"
  use "kabouzeid/nvim-lspinstall"
  use "nvim-treesitter/nvim-treesitter"
  use "hrsh7th/nvim-compe"
  use "neovim/nvim-lspconfig"
  use 'lambdalisue/fern-renderer-nerdfont.vim'
  use 'folke/tokyonight.nvim'
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {
    "nvim-telescope/telescope.nvim",
    requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
  }
  use {
    "akinsho/nvim-bufferline.lua",
    requires = "kyazdani42/nvim-web-devicons"
  }
end)
local opt = vim.opt
local g = vim.g

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
nnoremap <leader>nn :Fern -drawer . -toggle<CR>
let g:fern#renderer = "nerdfont"
function! Init_fern() abort
  nmap <buffer> <Plug>(fern-action-open) <Plug>(fern-action-open:select)
  nmap <buffer> d <Plug>(fern-action-remove)
  setlocal nonumber norelativenumber 
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call Init_fern()
augroup END
colorscheme tokyonight
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

" Telescope
nnoremap <leader>ff :Telescope find_files hidden=true<CR>
nnoremap <leader>fb :Telescope buffers<CR>
nnoremap <leader>fh :Telescope help_tags<CR>
nnoremap <leader>fi :Telescope live_grep<CR>
nnoremap <leader>fg :Telescope git_status<CR>
nnoremap <leader>fo :Telescope oldfiles<CR>
nnoremap <leader>fn :Telescope file_browser hidden=true<CR>

map <Up> <NOP>
map <Down> <NOP>
map <Left> <NOP>
map <Right> <NOP>

nnoremap <leader>` :call ChooseTerm("term-slider", 1)<CR>
nnoremap <leader><CR> :call ChooseTerm("term-pane", 0)<CR>
 
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

" compe completion
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Lspsaga
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
]]

local function clock() return " " .. os.date("%H:%M") end

local function lsp_progress()
    local messages = vim.lsp.util.get_progress_messages()
    if #messages == 0 then return end
    local status = {}
    for _, msg in pairs(messages) do
        table.insert(status, (msg.percentage or 0) .. "%% " .. (msg.title or ""))
    end
    local spinners = {
        "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏"
    }
    local ms = vim.loop.hrtime() / 1000000
    local frame = math.floor(ms / 120) % #spinners
    return table.concat(status, " | ") .. " " .. spinners[frame + 1]
end

vim.cmd([[autocmd User LspProgressUpdate let &ro = &ro]])

require('lualine').setup {
    options = {
        theme = "tokyonight",
        icons_enabled = true
    },
    sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch"},
        lualine_c = {{"diagnostics", sources = {"nvim_lsp"}}, "filename"},
        lualine_x = {"filetype", lsp_progress},
        lualine_y = {"progress"},
        lualine_z = {clock}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
}

require "top-bufferline"
require "compe-config"
require "telescope-conf"
require "lsp-config"
