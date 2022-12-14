-- Enables English spellchecking for "text-like" files
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"*.org", "*.txt", "*.md"},
    command = "setlocal spell spelllang=en_us",
})

vim.api.nvim_create_autocmd({"BufRead"}, {
    pattern = {"*.tex"},
    callback = function() vim.keymap.set("n", "<leader>le", '<cmd>update | !pdflatex % <CR>') end
})

vim.api.nvim_create_autocmd({"BufRead"}, {
    pattern = {"*.scss"},
    callback = function() vim.keymap.set("n", "<leader>le", '<cmd>update | !sass % <CR>') end
})

---- Compiles latex and opens corresponding pdf output
--vim.api.nvim_create_autocmd({"BufWrite"}, {
--    pattern = {"*.tex"},
--    command = "!pdflatex % && open '%:r'.pdf"
--})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"*.sage"},
    command = "setfiletype python"
})
--vim.cmd("augroup filetypedetect au! BufRead,BufNewFile *.sage,*.spyx,*.pyx setfiletype py augroup END")
-- Enables English spellchecking for "text-like" files
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"*.org", "*.txt", "*.md"},
    command = "setlocal spell spelllang=en_us",
})

vim.api.nvim_create_autocmd({"BufRead"}, {
    pattern = {"*.tex"},
    callback = function() vim.keymap.set("n", "<leader>le", '<cmd>update | !pdflatex % <CR>') end
})

vim.api.nvim_create_autocmd({"BufRead"}, {
    pattern = {"*.scss"},
    callback = function() vim.keymap.set("n", "<leader>le", '<cmd>update | !sass % %:r.css<CR>') end
})

--vim.api.nvim_create_autocmd({"BufWrite"}, {
--    pattern = {"*.html"},
--    command = "normal magg=G'a | !update %",
--})

---- Compiles latex and opens corresponding pdf output
--vim.api.nvim_create_autocmd({"BufWrite"}, {
--    pattern = {"*.tex"},
--    command = "!pdflatex % && open '%:r'.pdf"
--})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"*.sage"},
    command = "setfiletype python"
})
--vim.cmd("augroup filetypedetect au! BufRead,BufNewFile *.sage,*.spyx,*.pyx setfiletype py augroup END")
