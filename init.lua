require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'lambsdddalisue/fern.vim'
  use 'lambdalisue/nerdfont.vim'
  use 'lambdalisue/fern-renderer-nerdfont.vim'
  use 'folke/tokyonight.nvim'
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
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

require("mappings")

vim.cmd [[
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
