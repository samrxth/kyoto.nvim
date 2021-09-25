local utils = require("core.utils")
local kb = utils.keybindings

local defaults = {
  theme = "nord",
  interface = {
    border_style = "rounded",
    diagnostics = {
      error = "",
      warning = "",
      information = "",
      hint = ""
    }
  },
  keybindings = {
    window = function()
      kb.map("n", "<Leader><Leader>", "<C-^>", kb.opts)
      kb.map("n", "<C-J>",     "<C-W><C-J>",          { noremap = true })
      kb.map("n", "<C-K>",     "<C-W><C-K>",          { noremap = true })
      kb.map("n", "<C-L>",     "<C-W><C-L>",          { noremap = true })
      kb.map("n", "<C-H>",     "<C-W><C-H>",          { noremap = true })
      kb.map("n", "<C-Up>",    ":resize +5<CR>",      { noremap = true })
      kb.map("n", "<C-Down>",  ":resize -5<CR>",      { noremap = true })
      kb.map("n", "<C-Right>", ":vert resize +5<CR>", { noremap = true })
      kb.map("n", "<C-Left>",  ":vert resize -5<CR>", { noremap = true })
    end,
    lsp = function()
      kb.map("n", "K", ":Lspsaga hover_doc<CR>", kb.opts)
      kb.map("n", "gs",":Lspsaga signature_help<CR>", kb.opts)
      kb.map("n", "gd",":Lspsaga preview_definition<CR>", kb.opts)
      kb.map("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", kb.opts)
      kb.map("n", "<Leader>rn", ":Lspsaga rename<CR>", kb.opts)
      kb.map("n", "ca", ":Lspsaga code_action<CR>", kb.opts)
      kb.map("n", "[g", ":Lspsaga diagnostic_jump_next<CR>", kb.opts)
      kb.map("n", "]g", ":Lspsaga diagnostic_jump_prev<CR>", kb.opts)
    end,
    plugins = {
      nvimtree = function()
        kb.map("n", "<Leader>e",  "<cmd>NvimTreeToggle<CR>", kb.opts)
      end,
      telescope = function()
        kb.map("n", "<Leader>ff", ":Telescope find_files hidden=true<CR>", kb.opts)
      end,
      trouble = function()
        kb.map("n", "<Leader>xx", ":TroubleToggle<CR>", kb.opts)
      end
    }
  },
  plugins = {
    autopairs = true,
    syntax_parsers = {"javascript", "typescript", "python", "lua"},
  }
}

local function setup(config)
  for k, v in pairs(config) do defaults[k] = v end
  defaults.keybindings.window()
  return defaults
end

return setup
