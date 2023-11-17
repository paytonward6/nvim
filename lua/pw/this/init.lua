M = {}

M.asdf = function(opts)
    this = opts.fargs[1]
    print(this * this)
end

local popup = require("plenary.popup")

M.dothat = function()
    local lines = {"hello", "world"}
    local bufnr = vim.api.nvim_create_buf(false, false)
    id, win = popup.create(bufnr, {
        title = "Harpoon",
        highlight = "HarpoonWindow",
        line = math.floor(((vim.o.lines - 60) / 2) - 1),
        col = math.floor((vim.o.columns - 60) / 2),
        minwidth = 60,
        minheight = 10,
    })

    vim.api.nvim_buf_set_lines(bufnr, 0, #lines, false, lines)
    vim.keymap.set("n", "q", "<cmd>q<cr>", {buffer = bufnr})
end

vim.api.nvim_create_user_command("Asdf", M.asdf, {nargs = 1})
vim.api.nvim_create_user_command("Dothat", M.dothat, {})

return M
