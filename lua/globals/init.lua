local g = vim.g

g.mapleader = " "
g.nvim_tree_side = "right"
g.nvim_tree_auto_ignore_ft = {"startify", "dashboard"}
g.nvim_tree_ignore = {".git", "node_modules", ".cache"}

-- Transparent background
g.tokyonight_transparent = false

-- extra plugins to install (must only be strings)
g.kyoto_extra_plugins = {}

-- You can have plugin options here as well
g.vimwiki_list = {
  {
    path = "~/Documents/vimwiki"
  }
}

-- uncomment this out if you are experiencing issues with nvim-tree.lua
-- g.nvim_tree_git_hl = 0
-- g.nvim_tree_gitignore = 0
-- g.nvim_tree_show_icons = {
--   git = 0,
--   folders = 1,
--   files = 1
-- }
