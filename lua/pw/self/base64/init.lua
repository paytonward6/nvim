local core = require("pw.self.base64.core")
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

function M.build_command(line, mode)
    local command = "echo -n ".. vim.fn.shellescape(line) .. " | base64"

    if mode ==  "decode" then
        command = command .. " -d"
    end
    return command
end


function M.base64_line(line, format, mode)
    if format == "yaml" then
        local split_line  = split(line, ":")
        local key = split_line[1]
        local value = vim.fn.trim(split_line[2])

        local command = M.build_command(value, mode)

        local result = vim.fn.system(command)
        return key .. ": " .. vim.fn.trim(result)
    else
        local command = M.build_command(vim.fn.trim(line), mode)
        local result = vim.fn.system(command)
        return vim.fn.trim(result)
    end
end


function M.base64(start, last, args, mode)
    local lines = vim.api.nvim_buf_get_lines(0, start-1, last, false)

    local to_output = {}
    for _, line in ipairs(lines) do
        table.insert(to_output, M.base64_line(line, args, mode))
    end
    vim.api.nvim_buf_set_lines(0, start-1, last, false, to_output)
end

function M.shared_entrypoint(context, mode)
    M.base64(context.line1, context.line2, context.args, mode)
end

function M.decode(context)
    M.shared_entrypoint(context, "decode")
end

function M.encode(context)
    M.shared_entrypoint(context, nil)
end

vim.api.nvim_create_user_command("Base64Decode", M.decode, {
    nargs = "?",
    range = true,
})

vim.api.nvim_create_user_command("Base64Encode", M.encode, {
    nargs = "?",
    range = true,
})
