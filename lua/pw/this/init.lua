M = {}

M.asdf = function(opts)
    this = opts.fargs[1]
    print(this * this)
end

local popup = require("plenary.popup")

local config = {
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    width = 60,
    height = 10,
}


M.dothat = function(opts)
    local lines = {}
    for i, line in ipairs(opts.fargs) do
        lines[i] = line
    end

    local bufnr = vim.api.nvim_create_buf(false, false)

    local borderchars = config.borderchars
    local width = config.width
    local height = config.height

    local line = math.floor(((vim.o.lines - height) / 2) - 1)
    local col = math.floor((vim.o.columns - width) / 2)
    print(line, col)

    id, win = popup.create(bufnr, {
        title = "This",
        highlight = "",
        line = line,
        col = col,
        minwidth = width,
        minheight = height,
        borderchars = borderchars,
    })

    vim.api.nvim_win_set_option(
        win.border.win_id,
        "winhl",
        "Normal:This"
    )

    local map_event = function(line_content)
        local curr_line_num = vim.api.nvim_win_get_cursor(id)[1]
        return line_content[curr_line_num]
    end

    local run = function(line_content)
        return io.popen(map_event(line_content)):read("*l")
    end

    vim.api.nvim_buf_set_lines(bufnr, 0, #lines, false, lines)
    vim.keymap.set("n", "q", "<cmd>q<cr>", {buffer = bufnr})
    vim.keymap.set("n", "<cr>", function() vim.print(run(lines)) end, {buffer = bufnr})

    vim.bo.modifiable = false
    vim.bo.modified = false
end

M.black = function()
    cursor_pos = vim.api.nvim_win_get_cursor(0)
    vim.api.nvim_command("%!black - -q")

    line_count = vim.api.nvim_buf_line_count(0)
    if cursor_pos[1] > line_count then
        vim.api.nvim_win_set_cursor(0, {line_count, cursor_pos[2]})
    else
        vim.api.nvim_win_set_cursor(0, cursor_pos)
    end
end

vim.api.nvim_create_user_command("Asdf", M.asdf, {nargs = 1})
vim.api.nvim_create_user_command("Dothat", M.dothat, {nargs = "*"})
vim.api.nvim_create_user_command("Black", M.black, {nargs = 0})

return M
