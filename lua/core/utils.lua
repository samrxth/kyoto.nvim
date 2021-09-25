local M = {}

M.keybindings = {
  map = vim.api.nvim_set_keymap,
  opts = { silent = true, noremap = true }
}

return M
