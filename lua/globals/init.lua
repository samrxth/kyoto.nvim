local g = vim.g

g.mapleader = " "

-- Transparent background
-- g.tokyonight_transparent = true

-- plugin config
g.vimwiki_list = {
  {
    path = "~/Documents/vimwiki",
  },
}

-- extra plugins to install (must only be strings)
g.kyoto_extra_plugins = {}

local chadtree_settings = {
  view = {
    width = 34,
  },
  theme = {
    text_colour_set = "nord",
  },
}
vim.api.nvim_set_var("chadtree_settings", chadtree_settings)
