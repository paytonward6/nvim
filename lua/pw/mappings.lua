-- Mapping helper
local map = function(mode, key, result) vim.keymap.set(mode, key, result, { noremap = true, silent = true }) end

-- Essentials
vim.keymap.set('i', 'kj', '<Esc>l')
vim.keymap.set('i', '<C-j>', '<Esc>l')
vim.keymap.set('n', '<C-K>', '<C-z>') -- allows suspension of nvim via homerow
vim.keymap.set('n', '<Space>w', '<C-w>') -- for window management
vim.keymap.set('n', '<C-s>', '<Cmd>update<CR>')
vim.keymap.set('n', '<leader>lsp', '<Cmd>LspStart<CR>')
--map('n', '<Space>fs', ':w<CR>')

    -- For moving across screen lines
--vim.keymap.set('n', 'k', 'gk')
--vim.keymap.set('n', 'j', 'gj')
--vim.keymap.set('n', '0', 'gO')
--vim.keymap.set('n', '$', 'g$')


-- Mimic shell movements
vim.keymap.set('i', '<C-E>', '<ESC>A')
vim.keymap.set('i', '<C-A>', '<ESC>I')

-- NvimTree
--vim.keymap.set('n', '<leader>n', ':NvimTreeOpen<CR>')
--vim.keymap.set('n', '<leader>e', '<Cmd>E<CR>')
vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>')
--vim.keymap.set('n', '<leader>f',':NvimTreeFindFile<CR>')
vim.keymap.set('n', '<leader><tab>t',':vsplit term://bash<CR>')
vim.keymap.set('n', '<leader>th', ':noh<CR>')

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Buffer Keymaps
-- Move to previous/next buffer
vim.keymap.set('n', '<leader>{', '<Cmd>BufferPrevious<CR>', opts)
vim.keymap.set('n', '<leader>}', '<Cmd>BufferNext<CR>', opts)

-- Goto buffer in position...
    -- A is the option/alt key
vim.keymap.set('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
vim.keymap.set('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
vim.keymap.set('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
vim.keymap.set('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
vim.keymap.set('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
vim.keymap.set('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
vim.keymap.set('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
vim.keymap.set('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
vim.keymap.set('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
vim.keymap.set('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
vim.keymap.set('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
vim.keymap.set('n', '<leader>bc', '<Cmd>BufferClose<CR>', opts)
vim.keymap.set('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)

-- Sort automatically by...
--vim.keymap.set('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
--vim.keymap.set('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
--vim.keymap.set('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
--vim.keymap.set('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

-- TELESCOPE
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts)
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts)
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts)
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opts)
vim.keymap.set("n", "<leader>dc", '<cmd>Telescope current_buffer_fuzzy_find<cr>', opts)
vim.keymap.set("n", "<leader>ds", '<cmd>Telescope lsp_document_symbols<cr>', opts)
vim.keymap.set("n", "<leader>fc", '<cmd>Telescope commands<CR>', opts)
vim.keymap.set("n", "<leader>fk", '<cmd>Telescope file_browser<CR>', opts)

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

-- Toggle Term
vim.keymap.set("n", "<leader>G", '<cmd> ToggleTerm<CR>')
vim.keymap.set("t", "<C-G>", '<cmd> ToggleTerm<CR>')

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

-- Latex
    -- Compiles current file with Latex
--vim.keymap.set("n", "<leader>le", '<cmd>!pdflatex % <CR>')
