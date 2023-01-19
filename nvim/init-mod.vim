so "~/.config/zsh/.zprofile"
" tab and shift tab
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>

"this method works on both my cse ssh and personal iterm
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
"this is however marginally slower. to fix this we have
set ttimeout
set ttimeoutlen=1
set ttyfast

autocmd FileType python map <buffer> <leader>r :w<CR>:!clear;python3 %<CR>


let g:vimtex_view_general_viewer = 'zathura'



" placing after table-mode plugin is loaded





" vim-zettel
let g:zettel_fzf_command = "rg --column --line-number --ignore-case --no-heading --color=always"

let g:zettel_options = [{}, {"front_matter" : [["tags", ""], ["type","note"]], "template" :  "~/mytemplate.tpl"}]




