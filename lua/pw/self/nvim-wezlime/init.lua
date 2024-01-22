
local wezterm_list_clients = function()
    local output = vim.fn.system("wezterm cli list-clients --format json")
    local json = vim.json.decode(output)
    return json
end

local wezterm_pane_right = function()
    local output = vim.fn.system("wezterm cli get-pane-direction right")
    return vim.trim(output)
end

local wezterm_send_text = function(pane_id, text)
    local command = {"wezterm", "cli", "send-text", "--pane-id", pane_id}
    vim.fn.system(command, text)
end

local current_pane_id = function()
    local client_json = wezterm_list_clients()
    assert(table.getn(client_json) == 1, "More than one wezterm client detected")

    local client = client_json[1]
    return client.focused_pane_id
end

local wezterm_list = function()
    local output = vim.fn.system("wezterm cli list --format json")
    local json = vim.json.decode(output)
    return json
end

local current_pane_info = function()
    local current_pane_id = current_pane_id()

    for k, v in pairs(wezterm_list()) do
        if v.pane_id == current_pane_id then
            return {
                pane_id = current_pane_id,
                tab_id = v.tab_id,
                window_id = v.window_id
            }
        end
    end
end

local slime_pane = function()
    local current_pane = current_pane_info()

    for k, v in pairs(wezterm_list()) do
        if v.pane_id == current_pane.pane_id then
            goto continue
        elseif v.tab_id == current_pane.tab_id then
            return {
                pane_id = v.pane_id,
                tab_id = v.tab_id,
                window_id = v.window_id,
            }
        end
        ::continue::
    end
end

local _get_block_bounds = function()
    local current_line_num = vim.api.nvim_win_get_cursor(0)[1]
    local num_lines = vim.api.nvim_buf_line_count(0)

    local above = current_line_num
    while vim.api.nvim_buf_get_lines(0, above - 1, above, true)[1] ~= "" do
        above = above - 1
        if above <= 0 then
            above = above + 1
            goto continue
        end
    end
    above = above + 1
    ::continue::

    local below = current_line_num
    while vim.api.nvim_buf_get_lines(0, below, below + 1, true)[1] ~= "" do
        below = below + 1
        if below >= num_lines then
            return  {
                start = above,
                last = below,
            }
        end
    end

    return {start = above, last = below}
end

local get_cur_block = function()
    local bounds = _get_block_bounds()
    local text = vim.api.nvim_buf_get_lines(0, bounds.start - 1, bounds.last, false)

    return text
end

local send = function()
    local text = get_cur_block()
    text = vim.fn.join(text, "\n")
    wezterm_send_text(wezterm_pane_right(), text)
    wezterm_send_text(wezterm_pane_right(), "\n")
end


vim.api.nvim_create_user_command("GetLine", get_cur_block, {nargs = 0})
vim.api.nvim_create_user_command("Send", send, {nargs = 0})
