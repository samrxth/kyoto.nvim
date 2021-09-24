require("nvim-treesitter.configs").setup({
  ensure_installed = _G.kyoto.syntax_highlighting,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true
  }
})
