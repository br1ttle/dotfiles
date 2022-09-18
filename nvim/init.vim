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
nnoremap <backspace> :Lf<CR>


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
Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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

nnoremap H :w<CR>:AsyncRun '/Users/aayushbajaj/Google Drive/2. - code/206. - scripts/handout' '%'<CR>

let g:calendar_keys = { 'goto_today': 'T'}


nnoremap E :silent ! '/Users/aayushbajaj/Google Drive/2. - code/202. - c/202.6 - bytelocker/bytelocker' '%' '$bl_pass'<CR>:set noro<CR>

" primeagen space paste remap
xnoremap <leader>p "_dP

" lf
let g:NERDTreeHijackNetrw = 0 " Add this line if you use NERDTree
let g:lf_replace_netrw = 1 " Open lf when vim opens a directory
let g:floaterm_height = 0.95
let g:floaterm_width = 0.95

" lazygit
nnoremap <leader>g :FloatermNew lazygit<CR>



" trying
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

