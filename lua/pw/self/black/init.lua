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

vim.api.nvim_create_user_command("Black", M.black, {nargs = 0})

return M
