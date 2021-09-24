local lsp = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspinstall").setup() -- important

local function common_on_attach(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = { noremap = true, silent = true }
  buf_set_keymap(
    "n",
    "<space>ca",
    "<cmd>lua vim.lsp.buf.code_action()<CR>",
    opts
  )
  buf_set_keymap(
    "n",
    "<space>e",
    "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",
    opts
  )
  buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
end

local servers = require("lspinstall").installed_servers()
for _, server in pairs(servers) do
  local client = lsp[server]
  local config = client
  lsp[server].setup({
    on_attach = config.on_attach or common_on_attach,
    settings = config.settings or {},
  })
end

vim.fn.sign_define(
  "LspDiagnosticsSignError",
  { text = "", numhl = "LspDiagnosticsDefaultError" }
)
vim.fn.sign_define(
  "LspDiagnosticsSignWarning",
  { text = "", numhl = "LspDiagnosticsDefaultWarning" }
)
vim.fn.sign_define(
  "LspDiagnosticsSignInformation",
  { text = "", numhl = "LspDiagnosticsDefaultInformation" }
)
vim.fn.sign_define(
  "LspDiagnosticsSignHint",
  { text = "", numhl = "LspDiagnosticsDefaultHint" }
)

-- set default prefix.
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    -- virtual_text = false,
    virtual_text = { prefix = "" },
    signs = true,
    update_in_insert = false,
  }
)
