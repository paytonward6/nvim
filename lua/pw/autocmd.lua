-- Spellcheck 

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"*.org", "*.txt", "*.md"},
    command = "setlocal spell spelllang=en_us"
})
