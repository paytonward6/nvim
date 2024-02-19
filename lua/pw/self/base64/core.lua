local uppercase_offset = -65
local lowercase_offset = 26 - 97
local num_offset = 52 - 48

local M = {}

local function to_bin(num,bits)
    -- returns a table of bits, most significant first.
    bits = bits or math.max(1, select(2, math.frexp(num)))
    local t = {} -- will contain the bits        
    for b = bits, 1, -1 do
        t[b] = math.fmod(num, 2)
        num = math.floor((num - t[b]) / 2)
    end
    return t
end

---@return table
local function char_to_bin(char)
    local result = nil

    if "0" <= char and char <= "9" then
        result = string.byte(char) + num_offset
    elseif "a" <= char and char <= "z" then
        result = string.byte(char) + lowercase_offset
    elseif "A" <= char and char <= "Z" then
        result = string.byte(char) + uppercase_offset
    elseif char == "+" or char == "/" then
        result = string.byte(char) + uppercase_offset
    else
        error(char .. " cannot be decoded!")
    end

    result = to_bin(result, 8)
    table.remove(result, 1)
    table.remove(result, 1)
    return result
end

local function append(tbl, to_append)
    for _, i in ipairs(to_append) do
        table.insert(tbl, i)
    end
end

local function bin_to_int(tbl)
    local result = 0
    local shift = 0
    for i=#tbl,1,-1 do
        local val = tbl[i]
        if val ~= 0 then
            result = result + math.pow(2, shift)
        end
        shift = shift + 1
    end
    return result
end

local function chunk(tbl, size)
    local to_return = {}
    for i=1,#tbl,size do
        table.insert(to_return, {unpack(tbl, i, i + size-1)})
    end
    return to_return
end

function M.decode(input)
    -- Algorithm inspired by https://rosettacode.org/wiki/Base64_decode_data#Rust
    local result = {}
    for char in input:gmatch(".") do
        if char == "=" then
            goto continue
        end
        local bin = char_to_bin(char)
        append(result, bin)
        ::continue::
    end

    local chunks = chunk(result, 8)

    local to_return = {}
    for _, i in ipairs(chunks) do
        local to_int = bin_to_int(i)
        if to_int ~= 0 then
            table.insert(to_return, string.char(to_int))
        end
    end
    return table.concat(to_return)
end

return M
