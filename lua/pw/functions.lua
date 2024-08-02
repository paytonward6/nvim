
local M = {}

M.del_other_bufs = function()
    local curr_buf = vim.api.nvim_get_current_buf()
    for _, buf_num in ipairs(vim.api.nvim_list_bufs()) do
        if buf_num ~= curr_buf then
            if vim.api.nvim_buf_is_loaded(buf_num) then
                vim.api.nvim_buf_delete(buf_num, {})
            end
        end
    end
end

M.current_file = function()
    vim.cmd('read! echo %:p:.')
end

M.copy_current_file = function()
    M.current_file()
    vim.cmd.norm('yyu')
end

return M
