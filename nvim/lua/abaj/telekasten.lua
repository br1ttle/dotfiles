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


nnoremap <leader>zf :lua require('telekasten').find_notes()<CR>
nnoremap <leader>zd :lua require('telekasten').find_daily_notes()<CR>
nnoremap <leader>zb :lua require('telekasten').show_backlinks()<CR>
nnoremap <leader>zg :lua require('telekasten').search_notes()<CR>
nnoremap <leader>zz :lua require('telekasten').follow_link()<CR>
nnoremap <leader>zn :lua require('telekasten').new_note()<CR>
nnoremap <leader>zi :lua require('telekasten').insert_link()<CR>

-- on hesitation, bring up the panel
nnoremap <leader>Z :lua require('telekasten').panel()<CR>
