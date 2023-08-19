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


return M
