M = {}

local popup = require("plenary.popup")

local config = {
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    width = 60,
    height = 10,
}

local function create_window()
    local bufnr = vim.api.nvim_create_buf(false, false)

    local borderchars = config.borderchars
    local width = config.width
    local height = config.height

    local line = math.floor(((vim.o.lines - height) / 2) - 1)
    local col = math.floor((vim.o.columns - width) / 2)

    local id, win = popup.create(bufnr, {
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
    return {bufnr = bufnr, id = id, win = win}
end

M.dothat = function(opts)

    local lines = opts.fargs

    local window = create_window()

    local map_event = function(line_content)
        local curr_line_num = vim.api.nvim_win_get_cursor(window.id)[1]
        return line_content[curr_line_num]
    end

    local run = function(line_content)
        return io.popen(map_event(line_content)):read("*l")
    end

    vim.api.nvim_buf_set_lines(window.bufnr, 0, #lines, false, lines)
    vim.keymap.set("n", "q", "<cmd>q<cr>", {buffer = window.bufnr})
    vim.keymap.set("n", "<cr>", function() vim.print(run(lines)) end, {buffer = window.bufnr})

    vim.bo.modifiable = false
    vim.bo.modified = false
end

vim.api.nvim_create_user_command("Dothat", M.dothat, {nargs = "*"})

return M
