local g = vim.g

g.mapleader = " "

-- Transparent background
g.tokyonight_transparent = false

-- extra plugins to install (must only be strings)
g.kyoto_extra_plugins = {}

-- Custom options for lsp
g.kyoto_lsp_configs = {
  lua = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  },
}

-- uncomment this out if you are experiencing issues with nvim-tree.lua
-- g.nvim_tree_git_hl = 0
-- g.nvim_tree_gitignore = 0
-- g.nvim_tree_show_icons = {
--   git = 0,
--   folders = 1,
--   files = 1
-- }
--
vim.cmd("packadd nvim-tree.lua")
g.nvim_tree_side = "right"

g.nvim_tree_ignore = { ".git", "node_modules", ".cache" } -- ignore mathcing patterns
g.nvim_tree_auto_ignore_ft = { "dashboard" } -- don't open tree on specific fiypes.
g.nvim_tree_auto_close = 0 -- closes tree when it's the last window

-- Icons
g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "✗",
    staged = "✓",
    unmerged = "",
    renamed = "➜",
    untracked = "★",
    deleted = "",
    ignored = "◌",
  },
  folder = {
    arrow_open = "",
    arrow_closed = "",
    default = "",
    open = "",
    empty = "", -- 
    empty_open = "",
    symlink = "",
    symlink_open = "",
  },
}

local tree_cb = require("nvim-tree.config").nvim_tree_callback
-- default mappings
vim.g.nvim_tree_bindings = {
  { key = { "<CR>", "o", "<2-LeftMouse>" }, cb = tree_cb("edit") },
  { key = { "<2-RightMouse>", "<C-]>" }, cb = tree_cb("cd") },
  { key = "<C-v>", cb = tree_cb("vsplit") },
  { key = "<C-x>", cb = tree_cb("split") },
  { key = "<C-t>", cb = tree_cb("tabnew") },
  { key = "<", cb = tree_cb("prev_sibling") },
  { key = ">", cb = tree_cb("next_sibling") },
  { key = "P", cb = tree_cb("parent_node") },
  { key = "<BS>", cb = tree_cb("close_node") },
  { key = "<S-CR>", cb = tree_cb("close_node") },
  { key = "<Tab>", cb = tree_cb("preview") },
  { key = "K", cb = tree_cb("first_sibling") },
  { key = "J", cb = tree_cb("last_sibling") },
  { key = "I", cb = tree_cb("toggle_ignored") },
  { key = "H", cb = tree_cb("toggle_dotfiles") },
  { key = "R", cb = tree_cb("refresh") },
  { key = "a", cb = tree_cb("create") },
  { key = "d", cb = tree_cb("remove") },
  { key = "r", cb = tree_cb("rename") },
  { key = "<C-r>", cb = tree_cb("full_rename") },
  { key = "x", cb = tree_cb("cut") },
  { key = "c", cb = tree_cb("copy") },
  { key = "p", cb = tree_cb("paste") },
  { key = "y", cb = tree_cb("copy_name") },
  { key = "Y", cb = tree_cb("copy_path") },
  { key = "gy", cb = tree_cb("copy_absolute_path") },
  { key = "[c", cb = tree_cb("prev_git_item") },
  { key = "]c", cb = tree_cb("next_git_item") },
  { key = "-", cb = tree_cb("dir_up") },
  { key = "s", cb = tree_cb("system_open") },
  { key = "q", cb = tree_cb("close") },
  { key = "g?", cb = tree_cb("toggle_help") },
}
