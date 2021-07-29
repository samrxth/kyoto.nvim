local vim = vim

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require "lspinstall".setup() -- important

local servers = require "lspinstall".installed_servers()
for _, server in pairs(servers) do
  require "lspconfig"[server].setup {}
end

require("lspkind").init()

vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})

require("trouble").setup {}
-- require("formatter").setup(
--   {
--     logging = false,
--     filetype = {
--       javascript = {
--         -- prettier
--         function()
--           return {
--             exe = "prettier",
--             args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
--             stdin = true
--           }
--         end
--       },
--       rust = {
--         -- Rustfmt
--         function()
--           return {
--             exe = "rustfmt",
--             args = {"--emit=stdout"},
--             stdin = true
--           }
--         end
--       },
--       lua = {
--         -- luafmt
--         function()
--           return {
--             exe = "luafmt",
--             args = {"--indent-count", 2, "--stdin"},
--             stdin = true
--           }
--         end
--       },
--       cpp = {
--         -- clang-format
--         function()
--           return {
--             exe = "clang-format",
--             args = {},
--             stdin = true,
--             cwd = vim.fn.expand("%:p:h") -- Run clang-format in cwd of the file.
--           }
--         end
--       }
--     }
--   }
-- )
