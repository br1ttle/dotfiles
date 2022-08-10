runtime ftplugin/man.vim

so "~/.config/zsh/.zprofile"

" allow persistent undos
set undodir=~/.config/nvim/undid
set undofile
"turn on search highlighting
set hlsearch

" turn on visual mode character count
set showcmd

"turn on partial search
set incsearch

"turn on case insensitive search
set ignorecase

"turn numbers on
set nu

"turn relative numbers on
set rnu

"split new window to right
set splitright

set nowrap

"set nofoldenable

" vimwiki lets
"let g:vimwiki_list = [{'path': '~/vimwiki',
"                      \ 'syntax': 'markdown', 'ext': '.md'}]

" diary lets
let g:calendar_monday = 1
let g:calendar_weeknm = 2 

" if hostname() == 'abelard.local'
" endif
let g:vimwiki_list = [{'path': '$HOME/Google Drive/2. - code/212. - vimwiki/212.00 - cs',
					  \ 'syntax': 'markdown', 'ext': '.md'},
					  \ {'path': '$HOME/Google Drive/2. - code/212. - vimwiki/212.01 - pkm',
					  \ 'syntax': 'markdown', 'ext': '.md'}]


""augroup remember_folds
"	autocmd!
"	autocmd BufWinLeave * mkview
"	autocmd BufWinEnter * silent! loadview
"augroup END


" setting leader key
let mapleader = "\<Esc>"


"remaps

" j and k to centre after each move
nnoremap j jzz
nnoremap k kzz
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <CR> <CR>zz
inoremap <CR> <C-\><C-O><C-E><CR>
inoremap <BS> <BS><C-O>zz
inoremap <right> <right><C-O>zz
inoremap <left> <left><C-O>zz
inoremap <up> <up><C-O>zz
inoremap <down> <down><C-O>zz

"letter t to l
nnoremap t l
vnoremap t l

" tab and shift tab
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>


" pairs
inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap ' ''<Left>
inoremap " ""<Left>
inoremap $ $$<Left>

nnoremap { <C-u>zz
nnoremap } <C-d>zz

" map enter to remove search highlighting
nnoremap <CR> :noh<CR><CR>

nmap <leader>. <Plug>Zoom

" opens tag under cursor
nnoremap go g<c-]>
vnoremap go g<c-]>

" remaps backspace to file explorer in normal mode
nnoremap <backspace> :E<CR>


" leader
" previous / next in buffer
nnoremap <leader>h :bprevious<CR>
nnoremap <leader>t :bnext<CR>
" navigate buffers
nnoremap <leader>' :buffers<CR>:buffer<Space>
" insert single character
nnoremap <leader>, a_<Esc>r
" splits
" horizontal / vertical split
nnoremap <leader>- <C-w>s
nnoremap <leader>s <C-w>v 
" move left / right / down / up through splits
nnoremap <leader>m <C-w>h
nnoremap <leader>w <C-w>l
nnoremap <leader>v <C-w>j
nnoremap <leader>z <C-w>k
" kill split
nnoremap <leader>x <C-w>q
" kill buffer
nnoremap <leader>X :bd<CR>
" open vert split with nerdtree
nnoremap <leader>u :vsp<CR>:Explore<CR>
" open empty file in new buffer
nnoremap <leader>e :enew<CR>
" open configs
nnoremap <leader>cv :RC<CR>
nnoremap <leader>cz :e ~/.config/zsh/.zshrc<CR>

" TODO
" open crontab
" will need to write the cronedit function 
" nmap <silent> <leader>ct :call cronedit()<CR>
"

" vimwiki remaps
" toggle todos
nmap <space><space> <Plug>VimwikiToggleListItem
vmap <space><space> <Plug>VimwikiToggleListItem
" open vimwiki
nmap <space>v <Plug>VimwikiIndex
vmap <space>v <Plug>VimwikiIndex
" diary
" open vimdiary
nmap <space>V <Plug>VimwikiDiaryIndex
vmap <space>V <Plug>VimwikiDiaryIndex
" create today entry
nmap <space>w <Plug>VimwikiMakeDiaryNote
vmap <space>w <Plug>VimwikiMakeDiaryNote
" create yesterday entry
nmap <space>m <Plug>VimwikiMakeYesterdayDiaryNote
vmap <space>m <Plug>VimwikiMakeYesterdayDiaryNote
" create tomorrow entry
nmap <space>z <Plug>VimwikiMakeTomorrowDiaryNote
vmap <space>z <Plug>VimwikiMakeTomorrowDiaryNote
" remap diary next / previous day
nmap <space>t <Plug>VimwikiDiaryNextDay
vmap <space>t <Plug>VimwikiDiaryNextDay
nmap <space>h <Plug>VimwikiDiaryPrevDay
vmap <space>h <Plug>VimwikiDiaryPrevDay
" diary calendar
nmap <space>c :CalendarVR<CR>
vmap <space>c :CalendarVR<CR>

nmap <space>g <Plug>VimwikiDiaryGenerateLinks
vmap <space>g :<Plug>VimwikiDiaryGenerateLinks

nmap <space>s :setlocal spell! spelllang=en_au<CR>
vmap <space>s :setlocal spell! spelllang=en_au<CR>

" clipboard
nnoremap Y "*y

nnoremap <space>o o<Esc>
nnoremap <space>O O<Esc>


" /remaps

"forbid mouse from selecting numbers
se mouse+=a

"fixing indentation
set shiftwidth=4
set tabstop=4
set softtabstop=0

" getting rid of 'save buffer to exit'
set hidden


"this method works on both my cse ssh and personal iterm
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
"this is however marginally slower. to fix this we have
set ttimeout
set ttimeoutlen=1
set ttyfast


"allow arrow keys to move across lines
set whichwrap+=<,>,h,l,[,]

"plug install (the manager)
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/plugged')
" notic how I call the plug betwixt the call begin & end
" tokyonight theme
Plug 'ghifarit53/tokyonight-vim'
" fuzzy finder fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Mathijs-Bakker/zoom-vim'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-surround'
Plug 'lervag/vimtex'
"Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
"Plug 'vim-pandoc/vim-pandoc'
"Plug 'vim-pandoc/vim-pandoc-syntax'
"Plug 'godlygeek/tabular'
"Plug 'preservim/vim-markdown'
Plug 'masukomi/vim-markdown-folding'
Plug 'dhruvasagar/vim-table-mode'
Plug 'mattn/calendar-vim'
Plug 'https://github.com/wgurecky/vimSum.git', { 'do' : ':UpdateRemotePlugins' }
Plug 'preservim/nerdtree'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'renerocksai/telekasten.nvim'
Plug 'michal-h21/vim-zettel'
Plug 'xiyaowong/nvim-transparent'
Plug 'theniceboy/vim-calc'
Plug 'skywind3000/asyncrun.vim'
call plug#end()


let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
colorscheme tokyonight

"set gvim font size
set guifont=Menlo-Regular:h16

"getting extra text targets
Plug 'wellle/targets.vim'

" ruler at column 80
set colorcolumn=80

" keep search centred
nnoremap n nzzzv
nnoremap N Nzzzv

autocmd FileType python map <buffer> <leader>r :w<CR>:!clear;python3 %<CR>

let g:vimwiki_global_ext = 0

let g:vimwiki_folding = 'custom'
augroup folds
	autocmd FileType vimwiki set foldexpr=MarkdownFold()
	autocmd FileType vimwiki set foldmethod=expr
	autocmd FileType vimwiki set syntax=markdown
	autocmd FileType vimwiki set nofoldenable
	autocmd FileType vimwiki set linebreak
	autocmd FileType vimwiki set wrap
augroup END


" commands
command RC e $MYVIMRC

" vimwiki autogroup
"augroup vimwiki
"	autocmd!
"augroup end
"autocmd BufRead * if expand('%') =~ "index" | set syntax=vimwiki | endif

autocmd BufEnter diary.md VimwikiDiaryGenerateLinks " there is definitely a way
autocmd BufEnter diary.md set syntax=vimwiki " to concatenate these 2 lines
autocmd BufEnter index.md set syntax=vimwiki

let g:vimtex_view_general_viewer = 'zathura'


" nerdtree stuff in flux

autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

let NERDTreeMinimalUI=1

map <space>e :NERDTreeToggle<CR>

" telescope in flux
map <C-u> :Telescope live_grep<CR>

" quick fix list navigation
nnoremap <leader>g :cprev<CR>
nnoremap <leader>c :cnext<CR>
nnoremap <space>q :cexpr []<cr> 

function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

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

nmap <silent> <leader>l :call ToggleList("Location List", 'l')<CR>
nmap <silent> <leader>q :call ToggleList("Quickfix List", 'c')<CR>


" placing after table-mode plugin is loaded
nnoremap <space>[ [\|
nnoremap <space>] ]\|
nnoremap <space>{ {\|
nnoremap <space>} }\|



" telekasten
lua << END
local home = vim.fn.expand("~/Google Drive/2. - code/212. - vimwiki/212.01 - pkm")
require('telekasten').setup({
    home         = home,
    take_over_my_home = true,
    auto_set_filetype = true,
    dailies      = home .. '/' .. 'daily',
    weeklies     = home .. '/' .. 'weekly',
    templates    = home .. '/' .. 'templates',
    image_subdir = "img",
    extension    = ".md",
    prefix_title_by_uuid = false,
    uuid_type = "%Y%m%d%H%M",
    uuid_sep = "-",
    follow_creates_nonexisting = true,
    dailies_create_nonexisting = true,
    weeklies_create_nonexisting = true,
    journal_auto_open = false,
    template_new_note = home .. '/' .. 'templates/new_note.md',
    template_new_daily = home .. '/' .. 'templates/daily.md',
    template_new_weekly= home .. '/' .. 'templates/weekly.md',
    image_link_style = "markdown",
    sort = "filename",
    plug_into_calendar = true,
    calendar_opts = {
        weeknm = 4,
        calendar_monday = 1,
        calendar_mark = 'left-fit',
    },
    close_after_yanking = false,
    insert_after_inserting = true,
    tag_notation = "#tag",
    command_palette_theme = "dropdown",
    show_tags_theme = "ivy",
    subdirs_in_links = true,
    template_handling = "smart",
    new_note_location = "smart",
    rename_update_links = true,
})
END


" vim-zettel
let g:zettel_fzf_command = "rg --column --line-number --ignore-case --no-heading --color=always"

let g:zettel_options = [{}, {"front_matter" : [["tags", ""], ["type","note"]], "template" :  "~/mytemplate.tpl"}]



" telescope remaps

nnoremap <Leader>fw :lua require'telescope.builtin'.grep_string(require('telescope.themes').get_dropdown({}))<CR>

nnoremap <Leader>ff :lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({}))<CR>

nnoremap <Leader>fg :lua require'telescope.builtin'.live_grep(require('telescope.themes').get_dropdown({}))<CR>

nnoremap <Leader>fb :lua require'telescope.builtin'.buffers(require('telescope.themes').get_dropdown({}))<CR>

nnoremap <leader>zf :lua require('telekasten').find_notes()<CR>
nnoremap <leader>zd :lua require('telekasten').find_daily_notes()<CR>
nnoremap <leader>zb :lua require('telekasten').show_backlinks()<CR>
nnoremap <leader>zg :lua require('telekasten').search_notes()<CR>
nnoremap <leader>zz :lua require('telekasten').follow_link()<CR>
nnoremap <leader>zn :lua require('telekasten').new_note()<CR>
nnoremap <leader>zi :lua require('telekasten').insert_link()<CR>

" on hesitation, bring up the panel
nnoremap <leader>Z :lua require('telekasten').panel()<CR>

let g:transparent_enabled = v:true

let g:OxfDictionary#app_id='d9ac7995'
let g:OxfDictionary#app_key='c3e81fe9c9bd494a3efb4ef2a6a1ae76'


nnoremap <space>l :call Calc()<CR>


nnoremap P :w<CR>:AsyncRun '/Users/aayushbajaj/Google Drive/2. - code/206. - scripts/beamer' '%'<CR>


let g:calendar_keys = { 'goto_today': 'T'}


nnoremap E :silent ! '/Users/aayushbajaj/Google Drive/2. - code/202. - c/202.6 - bytelocker/bytelocker' '%' '$bl_pass'<CR>:set noro<CR>


