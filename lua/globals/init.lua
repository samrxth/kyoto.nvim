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

g.lsp_config = {
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

g.coq_settings = {
  auto_start = true,
  clients = {
    tabnine = {
      enabled = true,
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
