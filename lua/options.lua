local vim = vim
local opt = vim.opt
local g = vim.g

g.mapleader = " "

g.kyoto_dashboard = 1

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

