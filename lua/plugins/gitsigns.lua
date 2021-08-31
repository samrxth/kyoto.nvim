require("gitsigns").setup({
  signs = {
    add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
    change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
    delete = { hl = "DiffDelete", text = "_", numhl = "GitSignsDeleteNr" },
    topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
    changedelete = { hl = "DiffChange", text = "~", numhl = "GitSignsChangeNr" },
  },
  watch_index = {
    interval = 100,
  },
  sign_priority = 5,
  status_formatter = nil, -- Use default
})
