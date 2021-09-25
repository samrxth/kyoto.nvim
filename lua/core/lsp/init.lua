local lsp = require("lspconfig")
local lspinstall = require("lspinstall")
local configs = require("core.lsp.configs")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local function common_on_attach()
  _G.kyoto.keybindings.lsp()
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
  aux_set_signcolumn_sign("LspDiagnosticsSignError",          _G.kyoto.interface.diagnostics.error)
  aux_set_signcolumn_sign("LspDiagnosticsSignWarning",        _G.kyoto.interface.diagnostics.warning)
  aux_set_signcolumn_sign("LspDiagnosticsDefaultInformation", _G.kyoto.interface.diagnostics.information)
  aux_set_signcolumn_sign("LspDiagnosticsDefaultHint",        _G.kyoto.interface.diagnostics.hint)

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

