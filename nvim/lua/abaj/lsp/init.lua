local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("abaj.lsp.lsp-installer")
require("abaj.lsp.handlers").setup()
-- require "abaj.lsp.configs"
-- require "abaj.lsp.null-ls"
