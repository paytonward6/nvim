require('orgmode').setup_ts_grammar()
require('orgmode').setup({
    org_agenda_files = {'~/iCloud/org/*', '~/org//*'},
    org_default_notes_file = '~/iCloud/org/notes.org',
    win_split_mode = 'vertical',
    org_indent_mode = 'noindent',
    org_highlight_latex_and_related = "entities"
})

-- ORGMODE
    -- For Table-Mode
vim.g.table_mode_corner = '|'
