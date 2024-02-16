local M = {}

local function split(line, delim)
    local init = vim.fn.split(line, delim)
    local key = init[1]
    local value = ""
    if #init > 2 then
        table.remove(init, 1)
        value = vim.fn.join(init, delim)
    else
        value = init[2]
    end
    return {key, value}
end


function M.base64_line(line, base64_arg)
    local split_line  = split(line, ":")
    local key = split_line[1]
    local value = vim.fn.trim(split_line[2])
    local command = "echo -n ".. vim.fn.shellescape(value) .. " | base64"

    if base64_arg ==  "d" then
        command = command .. " -d"
    end

    local decoded = vim.fn.system(command)
    return key .. ": " .. vim.fn.trim(decoded)
end


function M.base64(start, last, base64_arg)
    local lines = vim.api.nvim_buf_get_lines(0, start-1, last, false)

    local to_output = {}
    for _, line in ipairs(lines) do
        table.insert(to_output, M.base64_line(line, base64_arg))
    end
    vim.api.nvim_buf_set_lines(0, start-1, last, false, to_output)
end


function M.main(context)
    M.base64(context.line1, context.line2, context.args)
end

vim.api.nvim_create_user_command("Base64", M.main, {
    nargs = "?",
    range = true,
})

