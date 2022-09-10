-- Enables English spellchecking for "text-like" files
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"*.org", "*.txt", "*.md"},
    command = "setlocal spell spelllang=en_us",
})

-- Compiles latex and opens corresponding pdf output
vim.api.nvim_create_autocmd({"BufWrite"}, {
    pattern = {"*.tex"},
    command = "!pdflatex % && open '%:r'.pdf"
})
