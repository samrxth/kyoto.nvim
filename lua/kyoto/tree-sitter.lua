require("nvim-treesitter.configs").setup({
  ensure_installed = _G.kyoto.plugins.syntax_parsers,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true
  },
  context_commentstring = { enable = true }
})
