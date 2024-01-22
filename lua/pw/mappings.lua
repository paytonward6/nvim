
local opts = { noremap = true, silent = true }

local pw_functions = require("pw.functions")

local keymaps = {
    {'i', 'kj', '<Esc>l'},
    {'i', '<C-j>', '<Esc>l'},
    {'n', '<C-K>', '<C-z>'}, -- allows suspension of nvim via homerow
    {'n', '<Space>w', '<C-w>'}, -- for window management
    {'n', '<C-s>', '<Cmd>update<CR>'},
    {'n', '<leader>lsp', '<Cmd>LspStart<CR>'},
    {'i', '<C-A>', '<ESC>I'},
    {'n', '<leader><tab>t',':vsplit term://bash<CR>'},
    {'n', '<leader>th', ':noh<CR>'},
    {"n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }},

    {"n", "<leader>gh", "<Cmd>vertical Git<CR>"},
    {"n", "<leader>gg", ":Git "},
    {"t", "<Esc>", "<C-\\><C-n>"},

    {"n", "<leader>ms", "<Cmd>LspStart<CR>"},
    {"n", "<leader>mr", "<Cmd>LspRestart<CR>"},
    {"n", "<leader>mh", "<Cmd>LspStop<CR>"},
    {"n", "<leader>mi", "<Cmd>LspInfo<CR>"},

    {"n", "<leader>vm", "<Cmd>mkview<CR>"},
    {"n", "<leader>vl", "<Cmd>loadview<CR>"},

    -- Buffer Keymaps
    -- Move to previous/next buffer
    {'n', '<leader>{', '<Cmd>BufferPrevious<CR>', opts},
    {'n', '<leader>}', '<Cmd>BufferNext<CR>', opts},

    -- Goto buffer in position...
    -- A is the option/alt key
    {'n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts},
    {'n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts},
    {'n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts},
    {'n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts},
    {'n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts},
    {'n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts},
    {'n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts},
    {'n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts},
    {'n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts},
    {'n', '<A-0>', '<Cmd>BufferLast<CR>', opts},
    {'n', '<A-p>', '<Cmd>BufferPin<CR>', opts},
    {'n', '<leader>bc', '<Cmd>BufferClose<CR>', opts},
    {'n', '<C-p>', '<Cmd>BufferPick<CR>', opts},
    -- TELESCOPE
    {'n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts},
    {'n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts},
    {'n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts},
    {'n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opts},
    {"n", "<leader>dc", '<cmd>Telescope current_buffer_fuzzy_find<cr>', opts},
    {"n", "<leader>ds", '<cmd>Telescope lsp_document_symbols<cr>', opts},
    {"n", "<leader>fc", '<cmd>Telescope commands<CR>', opts},
    {"n", "<leader>fk", '<cmd>Telescope file_browser<CR>', opts},
    {"n", "<leader>fl", function() require("telescope.builtin").find_files({cwd = require("telescope.utils").buffer_dir()}) end, opts},
    {"n", "<leader>bd", function() pw_functions.del_other_bufs() end, opts},
}

for _, keymap in ipairs(keymaps) do
    vim.keymap.set(unpack(keymap))
end 

vim.cmd('let g:conjure#mapping#doc_word  = v:false')


-- Debugger
--vim.keymap.set('n', '<leader>c', function() require('dap').continue() end)
--vim.keymap.set('n', '<leader>n', function() require('dap').step_over() end)
--vim.keymap.set('n', '<leader>j', function() require('dap').step_into() end)
--vim.keymap.set('n', '<leader>step_out', function() require('dap').step_out() end)
--vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
--vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
--vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
--vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
--vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
--vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
--  require('dap.ui.widgets').hover()
--end)
--vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
--  require('dap.ui.widgets').preview()
--end)
--vim.keymap.set('n', '<Leader>df', function()
--  local widgets = require('dap.ui.widgets')
--  widgets.centered_float(widgets.frames)
--end)
--vim.keymap.set('n', '<Leader>ds', function()
--  local widgets = require('dap.ui.widgets')
--  widgets.centered_float(widgets.scopes)
--end)

-- nabla.nvim
vim.keymap.set("n", "<leader>p", '<cmd>lua require("nabla").popup()<CR>')

-- venn.nvim: enable or disable keymappings
function _G.Toggle_venn()
    local venn_enabled = vim.inspect(vim.b.venn_enabled)
    if venn_enabled == "nil" then
        vim.b.venn_enabled = true
        vim.cmd[[setlocal ve=all]]
        -- draw a line on HJKL keystokes
        vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", {noremap = true})
        -- draw a box by pressing "f" with visual selection
        vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", {noremap = true})
    else
        vim.cmd[[setlocal ve=]]
        vim.cmd[[mapclear <buffer>]]
        vim.b.venn_enabled = nil
    end
end
    -- toggle keymappings for venn using <leader>v
vim.api.nvim_set_keymap('n', '<leader>tv', ":lua Toggle_venn()<CR>", { noremap = true})

