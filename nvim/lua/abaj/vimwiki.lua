vim.cmd([[
let g:calendar_monday = 1
let g:calendar_weeknm = 2 
let g:vimwiki_list = [{'path': '$HOME/Google Drive/2. - code/212. - vimwiki/212.00 - cs',
					  \ 'syntax': 'markdown', 'ext': '.md'},
					  \ {'path': '$HOME/Google Drive/2. - code/212. - vimwiki/212.01 - pkm',
					  \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0
let g:vimwiki_folding = 'custom'
let g:calendar_keys = { 'goto_today': 'T'}
nmap <space><space> <Plug>VimwikiToggleListItem
vmap <space><space> <Plug>VimwikiToggleListItem
nmap <space>v <Plug>VimwikiIndex
vmap <space>v <Plug>VimwikiIndex
nmap <space>V <Plug>VimwikiDiaryIndex
vmap <space>V <Plug>VimwikiDiaryIndex
nmap <space>w <Plug>VimwikiMakeDiaryNote
vmap <space>w <Plug>VimwikiMakeDiaryNote
nmap <space>m <Plug>VimwikiMakeYesterdayDiaryNote
vmap <space>m <Plug>VimwikiMakeYesterdayDiaryNote
nmap <space>z <Plug>VimwikiMakeTomorrowDiaryNote
vmap <space>z <Plug>VimwikiMakeTomorrowDiaryNote
nmap <space><E> <Plug>VimwikiTabnewLink
nmap <space>s :setlocal spell! spelllang=en_au<CR>
vmap <space>s :setlocal spell! spelllang=en_au<CR>
augroup folds
	autocmd FileType vimwiki set foldexpr=MarkdownFold()
	autocmd FileType vimwiki set foldmethod=expr
	autocmd FileType vimwiki set syntax=markdown
	autocmd FileType vimwiki set nofoldenable
	autocmd FileType vimwiki set linebreak
	autocmd FileType vimwiki set wrap
    autocmd FileType vimwiki nmap <space>t <Plug>VimwikiDiaryNextDay
    autocmd FileType vimwiki vmap <space>t <Plug>VimwikiDiaryNextDay
    autocmd FileType vimwiki nmap <space>h <Plug>VimwikiDiaryPrevDay
    autocmd FileType vimwiki vmap <space>h <Plug>VimwikiDiaryPrevDay
    autocmd FileType vimwiki nmap <space>g <Plug>VimwikiDiaryGenerateLinks
    autocmd FileType vimwiki vmap <space>g :<Plug>VimwikiDiaryGenerateLinks
    autocmd FileType vimwiki nmap <space>c :CalendarVR<CR>
    autocmd FileType vimwiki vmap <space>c :CalendarVR<CR>
augroup END
autocmd BufEnter diary.md VimwikiDiaryGenerateLinks
autocmd BufEnter diary.md set syntax=vimwiki
autocmd BufEnter index.md set syntax=vimwiki
]])

