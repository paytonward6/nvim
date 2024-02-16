M = {}


function M.main(base64_arg)
    local line = vim.api.nvim_get_current_line()
    local split_line  = vim.fn.split(line, ":")
    local key = split_line[1]
    local value = vim.fn.trim(split_line[2])
    local command = "echo -n ".. vim.fn.shellescape(value) .. " | base64"

    if base64_arg ==  "d" then
        command = command .. " -d"
    end

    local decoded = vim.fn.system(command)
    local new_current_line = key .. ": " .. vim.fn.trim(decoded)
    vim.api.nvim_set_current_line(new_current_line)
end


function M.base64(context)
    M.main(context.args)
end

vim.api.nvim_create_user_command("Base64", M.base64, {
    nargs = "?",
    range = true,
})

