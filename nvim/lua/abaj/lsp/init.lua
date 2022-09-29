M = {}
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require'lspconfig'.pyright.setup{}
require("mason").setup()
require("mason-lspconfig").setup()

return M
