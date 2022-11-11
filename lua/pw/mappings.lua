-- Mapping helper
local map = function(mode, key, result) vim.keymap.set(mode, key, result, { noremap = true, silent = true }) end
local no_plugins = require("pw.plugins")

-- Essentials
map('i', 'kj', '<Esc>l')
map('i', '<C-j>', '<Esc>l')
map('i', 'OO', 'o<Esc>')
map('n', '<C-K>', '<C-z>')
map('n', '<Space>w', '<C-w>')
--map('n', '<Space>fs', ':w<CR>')

    -- For moving across screen lines
map('n', 'k', 'gk')
map('n', 'j', 'gj')
map('n', '0', 'gO')
map('n', '$', 'g$')


-- Mimic shell movements
map('i', '<C-E>', '<ESC>A')
map('i', '<C-A>', '<ESC>I')
map('n', '<leader>n', ':NvimTreeOpen<CR>')
map('n', '<leader>te', ':NvimTreeToggle<CR>')
map('n', '<leader>f',':NvimTreeFindFile<CR>')
map('n', '<leader><tab>t',':vsplit term://bash<CR>')
map('n', '<leader>th', ':noh<CR>')

-- Command Mode Editing
vim.keymap.set("c", "<C-A>", '<Home>')
vim.keymap.set("c", "<C-B>", "<Left>")
vim.keymap.set("c", "<C-F>", "<Right>")

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<leader>{', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<leader>}', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
--map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<leader>bc', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

-- TELESCOPE
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts)
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts)
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts)
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opts)
vim.keymap.set("n", "<leader>dc", '<cmd>Telescope current_buffer_fuzzy_find<cr>', opts)
vim.keymap.set("n", "<leader>ds", '<cmd>Telescope lsp_document_symbols<cr>', opts)
vim.keymap.set("n", "<leader>fc", '<cmd>Telescope commands<CR>', opts)
-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used)

-- nabla.nvim
vim.keymap.set("n", "<leader>p", '<cmd>lua require("nabla").popup()<CR>')

-- Toggle Term
vim.keymap.set("n", "<leader>G", '<cmd> ToggleTerm<CR>')
vim.keymap.set("t", "<C-G>", '<cmd> ToggleTerm<CR>')

-- Venn.nvim
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
