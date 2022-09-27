-- quickfix list remaps
vim.cmd([[
nnoremap <leader>g :cprev<CR>
nnoremap <leader>c :cnext<CR>
nnoremap <leader>q :cexpr []<cr> 
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
