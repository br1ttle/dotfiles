require "abaj.options"
require "abaj.keymaps"
require "abaj.plugins"
require "abaj.vimwiki"
require "abaj.cmp"
require "abaj.lsp"
require "abaj.snippets"
require "abaj.latex"
require "abaj.luasnip"

-- latex
vim.cmd "let g:vimtex_view_general_viewer = 'open -a Brave Browser Beta.app'"
vim.cmd "let g:vimtex_view_general_options = '@pdf'"

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


-- quickfixlist
vim.cmd([[
nnoremap <leader>G :cprev<CR>
nnoremap <leader>C :cnext<CR>
nnoremap <leader>Q :cexpr []<cr> 
" nmap <silent> <leader>l :call ToggleList("Location List", 'l')<CR>
nmap <silent> <leader>q :call ToggleList("Quickfix List", 'c')<CR>
]])

-- functions
vim.cmd([[
function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction
]])

vim.cmd([[
function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction
]])
