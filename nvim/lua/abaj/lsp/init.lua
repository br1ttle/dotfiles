M = {}
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require'lspconfig'.pyright.setup{}

return M
