require "abaj.options"
require "abaj.keymaps"
require "abaj.plugins"
require "abaj.vimwiki"
require "abaj.cmp"
require "abaj.make"
--require "abaj.lsp"
require "abaj.snippets"
require "abaj.latex"
require "abaj.luasnip"


vim.cmd "colorscheme tokyonight"
vim.cmd "let g:transparent_enabled = v:true"
vim.cmd "let g:OxfDictionary#app_id='d9ac7995'"
vim.cmd "let g:OxfDictionary#app_key='c3e81fe9c9bd494a3efb4ef2a6a1ae76'"

-- lf
vim.cmd "let g:NERDTreeHijackNetrw = 0"
vim.cmd "let g:lf_replace_netrw = 1"
vim.cmd "let g:floaterm_height = 0.95"
vim.cmd "let g:floaterm_width = 0.95"


vim.g.lf_map_keys = 0
