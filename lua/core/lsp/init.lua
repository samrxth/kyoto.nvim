local lsp = require("lspconfig")
local lspinstall = require("lspinstall")
local configs = require("core.lsp.configs")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local function common_on_attach(_, bufnr)
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

local function load_servers()
  lspinstall.setup()
  local servers = lspinstall.installed_servers()

  for _, server in pairs(servers) do
    local client = lsp[server]
    local config = configs[server] or client

    client.setup({
      capabilities = capabilities,
      filetypes = config.filetypes or client.filetypes,
      on_attach = config.on_attach or common_on_attach,
      settings = config.settings or {},
    })
  end
end


local function aux_set_signcolumn_sign(diag_type, sign)
  vim.fn.sign_define(diag_type, {
    text = sign,
    numhl = diag_type
  })
end

local function setup_diagnostics()
  aux_set_signcolumn_sign("LspDiagnosticsSignError",          "")
  aux_set_signcolumn_sign("LspDiagnosticsSignWarning",        "")
  aux_set_signcolumn_sign("LspDiagnosticsDefaultInformation", "")
  aux_set_signcolumn_sign("LspDiagnosticsDefaultHint",        "")

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = { prefix = "" },
    signs = true,
    update_in_insert = false,
  })
end

-- Reload LSPInstall after installing a server
function lspinstall.post_install_hook()
	load_servers()
	vim.cmd("bufdo e")
end

-- Start servers with defined configs and defaults
local function setup_servers()
	setup_diagnostics()
	load_servers()
end

setup_servers()

