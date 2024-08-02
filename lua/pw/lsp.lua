local M = {}

M.custom_attach = function(client, bufnr)
    local keymap_opts = { buffer = bufnr, silent = true, noremap = true }
    vim.keymap.set("n", "K", vim.lsp.buf.hover, keymap_opts)
    vim.keymap.set("n", "<c-]>", vim.lsp.buf.definition, keymap_opts)
    vim.keymap.set("n", "<leader>gs", vim.lsp.buf.signature_help, keymap_opts)
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, keymap_opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, keymap_opts)
    vim.keymap.set("n", "<leader>bs", vim.lsp.buf.document_symbol, keymap_opts)
    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, keymap_opts)
    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, keymap_opts)
    vim.keymap.set("n", "<leader>dd", vim.diagnostic.disable, keymap_opts)
    vim.keymap.set("n", "<leader>de", vim.diagnostic.enable, keymap_opts)
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, keymap_opts)
    vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, keymap_opts)
    vim.keymap.set("n", "<leader>dl", vim.diagnostic.open_float, keymap_opts)
end

return M
