-- Enables English spellchecking for "text-like" files
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"*.org", "*.txt", "*.md"},
    command = "setlocal spell spelllang=en_us",
})

vim.api.nvim_create_autocmd({"BufEnter"}, {
    pattern = "*.j2",
    callback = function()
        local fname = vim.api.nvim_exec2("echo expand('%:t')", {output = true}).output

        -- Grab actual filetype
        fname = string.sub(fname, 1, #fname - 3)
        local ftype = vim.filetype.match({filename = fname})

        if ftype ~= nil then
            vim.cmd("silent! set filetype=" .. ftype)
        end
    end
})

vim.api.nvim_create_autocmd({"BufRead"}, {
    pattern = {"*.tex"},
    callback = function() vim.keymap.set("n", "<leader>le", '<cmd>update | !pdflatex % <CR>') end
})

vim.api.nvim_create_autocmd({"BufRead"}, {
    pattern = {"*.scss"},
    callback = function() vim.keymap.set("n", "<leader>le", '<cmd>update | !sass % <CR>') end
})

--------
local view_filetypes = {"*.md"}

vim.api.nvim_create_autocmd({"BufWinLeave"}, {
    pattern = view_filetypes,
    command = "mkview",
})

vim.api.nvim_create_autocmd({"BufWinEnter"}, {
    pattern = view_filetypes,
    command = "loadview",
})

vim.api.nvim_create_autocmd({"FileType"}, {
    pattern = "netrw",
    command = "set relativenumber",
})
--------

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
    callback = function() vim.keymap.set("n", "<leader>le", '<cmd>update | !pdflatex % && open -a Preview %:r.pdf<CR>') end
})

vim.api.nvim_create_autocmd({"BufRead"}, {
    pattern = {"*.md"},
    callback = function() vim.keymap.set("n", "<leader>le", '<cmd>update | !pandoc % -o %:r.pdf && open -a Preview %:r.pdf<CR>') end
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
