require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
require('dap-python').test_runner = 'pytest'
require("dapui").setup()

local debug_opts = { silent = true }
-- mac requires alt mappings to be expanded
vim.keymap.set('n', '<a-l>', require('dap').continue, debug_opts)    -- ¬ = alt-l
vim.keymap.set('n', '<a-h>', require('dap').step_over, debug_opts)   -- ˙ = alt-h
vim.keymap.set('n', '<a-j>', require('dap').step_into, debug_opts)   -- ∆ = alt-j
vim.keymap.set('n', '<a-k>', require('dap').step_out, debug_opts)    -- ˚ = alt-k
vim.keymap.set('n', '<a-s>', require('dap').disconnect, debug_opts)  -- ß = alt-s
vim.keymap.set('n', '<a-q>', require('dapui').close, debug_opts)
vim.keymap.set('n', '<a-r>', function()
        require('dap').disconnect()
        require('dap').run_last()
    end, debug_opts)    -- ® = alt-r

vim.keymap.set('n', '<leader>b', require('dap').toggle_breakpoint, debug_opts)
vim.keymap.set('n', '<leader>B', function() return require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, debug_opts)
vim.keymap.set('n', '<leader>lp', function() return require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, debug_opts)

-- todo what do these do? if you want them pick different mappings
-- " nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR> "dr might also be in use
-- " nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR> "dl is already in use!


local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--   dapui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
--   dapui.close()
-- end

local file_exists = function(name)
   local f = io.open(name, "r")
   return f ~= nil and io.close(f)
end

-- load local launch.json, pcall calls underlying function without throwing
if file_exists('.vscode/launch.json') then
    if pcall(require('dap.ext.vscode').load_launchjs) then
        -- print("Successfully loaded launch.json!")
    end
end
