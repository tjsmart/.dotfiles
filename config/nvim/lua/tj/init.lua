local hmark = require("harpoon.mark")
local hui = require("harpoon.ui")
local neotest = require("neotest")


local M = {}


-- collect harpoon filenames into a table
-- indexed by id
local function get_harpoon_filenames()
    local idx = 1
    local filenames = {}

    while (hmark.valid_index(idx)) do
        filenames[idx] = hmark.get_marked_file_name(idx)
        idx = idx + 1
    end

    return filenames
end


-- find the first test in the harpoon list (by id)
-- returns nil if none is found
local function find_first_test()
    local filenames = get_harpoon_filenames()
    for idx, filename in pairs(filenames) do
        if (filename:match('test_.*.py')) then
            return idx, filename
        end
    end
    return nil
end


-- navigate to the first found test and run neotest
function M.nav_and_run_first_test(args)
    args = args or {}
    table.insert(args, 0, vim.fn.expand("%"))

    local idx, filename = find_first_test()
    if idx == nil then
        print("No test file found in harpoon list!")
        return
    end

    hui.nav_file(idx)
    neotest.run.run(args)
    print(filename, " tests ran!")
end


---Reads the JSON `file`, and returns the dedcoded data.
---
---@param file string
---@return table<string, any> ... the decoded JSON data as a Lua table.
---@return string | nil ... An error message if the file couldn't be read or decoded, or nil if successful.
local function read_json(file)
    local fh = io.open(file, "r")
    if not fh then
        return {}, "Failed to open file"
    end

    local content = fh:read("*all")
    fh:close()

    local success, data = pcall(vim.fn.json_decode, content)
    if not success then
        return {}, "Failed to decode JSON"
    end

    return data, nil
end

---Splits the provided `str`, on the provided `delimiter` and returns the `parts`.
---
---@param str string
---@param delimiter string
---@return table<integer, string> parts
local function split_string(str, delimiter)
    local parts = {}
    for match in (str .. delimiter):gmatch("(.-)" .. delimiter) do
        table.insert(parts, match)
    end
    return parts
end


function M.open_last_failed_pytest()
    local pytest_lastfailed = "./.pytest_cache/v/cache/lastfailed"
    if vim.fn.filereadable(pytest_lastfailed) ~= 1 then
        vim.api.nvim_err_write("Error: " .. pytest_lastfailed .. " does not exist\n")
        return
    end

    local data, err = read_json(pytest_lastfailed)
    if err or not data then
        vim.api.nvim_err_write("Error: Failed to decode " .. pytest_lastfailed .. "\n")
        return
    end

    local quickfix_list = {}
    for test, _ in pairs(data) do
        local parts = split_string(test, "::")
        table.insert(quickfix_list, {filename = parts[1], linenr = 15, text = parts[2]})
    end

    -- Populate quickfix list and open the quickfix window
    vim.fn.setqflist(quickfix_list)
    vim.cmd("copen")
end


return M
