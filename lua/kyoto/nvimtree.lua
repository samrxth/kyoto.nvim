local tree_cb = require("nvim-tree.config").nvim_tree_callback

vim.g.nvim_tree_ignore = { ".git", "node_modules", ".cache" }
vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_auto_ignore_ft = { "dashboard" } -- don't open tree on specific fiypes.
vim.g.nvim_tree_auto_open = 0
vim.g.nvim_tree_auto_close = 0 -- closes tree when it's the last window
vim.g.nvim_tree_quit_on_open = 0 -- closes tree when file's opened
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 0
vim.g.nvim_tree_root_folder_modifier = table.concat({
  ":t:gs?$?/..",
  string.rep(" ", 1000),
  "?:gs?^??",
})
vim.g.nvim_tree_tab_open = 0
vim.g.nvim_tree_allow_resize = 1
vim.g.nvim_tree_add_trailing = 0 -- append a trailing slash to folder names
vim.g.nvim_tree_update_cwd = 1

vim.g.nvim_tree_icons = {
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
    default = "",
    open = "",
    empty = "", -- 
    empty_open = "",
    symlink = "",
    symlink_open = "",
  },
}

vim.g.nvim_tree_bindings = {
  { key = { "<CR>", "o", "<2-LeftMouse>" }, cb = tree_cb("edit") },
  { key = { "<2-RightMouse>", "<C-]>" }, cb = tree_cb("cd") },
  { key = "v", cb = tree_cb("vsplit") },
  { key = "x", cb = tree_cb("split") },
  { key = "<C-t>", cb = tree_cb("tabnew") },
  { key = "H", cb = tree_cb("toggle_dotfiles") },
  { key = "R", cb = tree_cb("refresh") },
  { key = "x", cb = tree_cb("cut") },
  { key = "gc", cb = tree_cb("copy") },
  { key = "p", cb = tree_cb("paste") },
  { key = "y", cb = tree_cb("copy_name") },
  { key = "Y", cb = tree_cb("copy_path") },
  { key = "gy", cb = tree_cb("copy_absolute_path") },
  { key = "-", cb = tree_cb("dir_up") },
  { key = "q", cb = tree_cb("close") },
  { key = "?", cb = tree_cb("toggle_help") },
}
