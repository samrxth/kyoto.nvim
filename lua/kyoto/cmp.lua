-- Setup nvim-cmp.
local cmp = require("cmp")
cmp.setup({
  confirmation = { default_behaviour = cmp.ConfirmBehavior.Replace },
  documentation = {
    border    = _G.kyoto.borders,
    max_width = 80
  },
  mapping = {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" }
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        vsnip = "[vsnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[Latex]",
      })[entry.source.name]
      vim_item.kind = ({
        Text          = " Text",
        Method        = " Method",
        Function      = " Function",
        Constructor   = " Constructor",
        Field         = " Field",
        Variable      = " Variable",
        Class         = " Class",
        Interface     = "ﰮ Interface",
        Module        = " Module",
        Property      = " Property",
        Unit          = " Unit",
        Value         = " Value",
        Enum          = " Enum",
        Keyword       = " Keyword",
        Snippet       = "﬌ Snippet",
        Color         = " Color",
        File          = " File",
        Reference     = " Reference",
        Folder        = " Folder",
        EnumMember    = " EnumMember",
        Constant      = " Constant",
        Struct        = " Struct",
        Event         = " Event",
        Operator      = "ﬦ Operator",
        TypeParameter = " TypeParameter",
      })[vim_item.kind]
      return vim_item
    end
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end
  }
})
