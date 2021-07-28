local vim = vim
local opt = vim.opt
local g = vim.g

g.mapleader = "<Space>"

g.kyoto_dashboard = 1

-- extra plugins to install
g.kyoto_extra_plugins = {}

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
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.background = "dark"
opt.whichwrap:append("<>hl")

g.mapleader = " "
g.user_emmet_leader_key = ","
g.nvim_tree_side = "right"
g.nvim_tree_auto_ignore_ft = {"startify", "dashboard"}
g.nvim_tree_ignore = {".git", "node_modules", ".cache"}

-- uncomment this out if you are experiencing issues with nvim-tree.lua
-- g.kyoto_nvim_tree_show_git = false
if os.getenv("GIT") == "0" or g.kyoto_nvim_tree_show_git == false then
  g.nvim_tree_git_hl = 0
  g.nvim_tree_gitignore = 0
  g.nvim_tree_show_icons = {
    git = 0,
    folders = 1,
    files = 1
  }
end

vim.cmd [[
  colorscheme tokyonight
]]
