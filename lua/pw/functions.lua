
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

return M
