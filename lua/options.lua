local opt = vim.opt
local g = vim.g

g.kyoto_nvim_tree_show_git = false
g.mapleader = " "
g.user_emmet_leader_key = ","
g.nvim_tree_side = 'right'
g.nvim_tree_auto_ignore_ft = { 'startify', 'dashboard' }
g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' }

-- uncomment this out if you are experiencing issues with nvim-tree.lua
g.kyoto_nvimtree_patch = 1

if os.getenv("GIT") == "0" or g.kyoto_nvim_tree_show_git == 1 then
  g.nvim_tree_git_hl = 0
  g.nvim_tree_gitignore = 0
  g.nvim_tree_show_icons = {
      git = 0,
      folders = 1,
      files = 1
  }
end

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
opt.whichwrap:append("<>hl")
opt.background = "dark"

g.loaded_gzip = 0
g.loaded_tar = 0
g.loaded_tarPlugin = 0
g.loaded_zipPlugin = 0
g.loaded_2html_plugin = 0
g.loaded_netrw = 0
g.loaded_netrwPlugin = 0
g.loaded_matchit = 0
g.loaded_matchparen = 0
g.loaded_spec = 0

g.python3_host_prog = "/usr/local/bin/python3"
g.indentLine_fileTypeExclude = {'dashboard', 'coc-explorer', 'terminal'}
