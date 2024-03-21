-- ------------------------------------------------------------
-- leader key
vim.g.mapleader = " "

-- ------------------------------------------------------------
-- plugins
require('plugins_tj')

-- ------------------------------------------------------------
-- lspconfig related settings
require('lsp_tj')

-- ------------------------------------------------------------
-- nvim-comp related settings
require('cmp_tj')

-- ------------------------------------------------------------
-- dap settings
require('dap_tj')

-- ------------------------------------------------------------
-- treesitter settings
require('treesitter_tj')

-- ------------------------------------------------------------
-- formatter settings
require('formatter_tj')

-- ------------------------------------------------------------
-- general settings

-- -- NOTE: disabled this for now, was getting on my nerves...
require('lsp_signature').setup{
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
      border = "rounded"
    },
    hint_enable = false,
    toggle_key = "<M-k>",
}

require('Comment').setup{}

require('nvim-web-devicons').setup{}

require('nightfox').setup{
    options = {
        transparent = true,
    }
}

require("catppuccin").setup({
    transparent_background = true,
    integrations = {
        nvimtree = { transparent_panel = true, },
    },
})

require("tokyonight").setup({
    style = "storm",  -- four styles: "storm", moon, "night", and "day"
    transparent = true,
    styles = {
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "transparent", -- style for sidebars, see below
        floats = "transparent", -- style for floating windows
    },
})

require("dracula").setup({
    transparent_bg = true,
})

-- require("gruvbox").setup({
--     transparent_mode = true,
-- })

require('rose-pine').setup({
    disable_background = true,
    disable_float_background = true,

    styles = {
        italic = false,
    }
})

-- vim.cmd[[colorscheme duskfox]]
vim.cmd[[colorscheme nordfox]]
-- vim.cmd[[colorscheme catppuccin]]
-- vim.cmd[[colorscheme tokyonight]]
-- vim.cmd[[colorscheme gruvbox]]
-- vim.cmd[[colorscheme rose-pine]]
-- vim.cmd[[colorscheme dracula]]

require('lualine').setup{
    options = {
        theme = 'nordfox',
        globalstatus = true,
    },
    -- sections
    sections = {
        lualine_c = {
            {
                -- use a relative path for filenames
                'filename',
                path = 1,
            }
        }
    },
}

-- require("nvim-tree").setup{
--   filters = {
--     custom = {"~formatter.*", "__pycache__", ".git", "venv"},
--   },
-- }


require("oil").setup{
    keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        -- ["<C-=>"] = "actions.select_vsplit",
        -- ["<C-->"] = "actions.select_split",
        ["<C-t>"] = "actions.select_tab",
        ["<C-k>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["<C-h>"] = "<C-w>h",
        ["<C-l>"] = "<C-w>l",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
        ["g\\"] = "actions.toggle_trash",
    },
    skip_confirm_for_simple_edits = true,
}

-- view project
vim.keymap.set("n", "<leader>pv", "<cmd>e .<cr>")
-- view file dir
vim.keymap.set("n", "<leader>e", "<cmd>e %:h<cr>")

require('gitsigns').setup()
vim.keymap.set("n", "<leader>hs", "<cmd>Gitsigns preview_hunk<cr>")
vim.keymap.set("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<cr>")
vim.keymap.set("n", "<leader>hp", "<cmd>Gitsigns prev_hunk<cr>")
vim.keymap.set("n", "<leader>hn", "<cmd>Gitsigns next_hunk<cr>")
vim.keymap.set("n", "<leader>ha", "<cmd>Gitsigns diffthis<cr>")


require("todo-comments").setup {
    signs = false,
    merge_keywords = false, -- just use my keywords, below
    keywords = {
        FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" , "TODO" } },
        WARN = { icon = " ", color = "warning", alt = { "WARNING" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
    },
    highlight = {
        keyword = "fg",
        after = "",
   },
}

-- ------------------------------------------------------------
-- vim options
local opt = vim.opt

-- opt.backspace = indent,eol,start
opt.background = 'dark'
opt.clipboard = "unnamedplus" -- use y and p with the system clipboard
-- opt.colorcolumn = '80'
opt.cursorline = true
opt.encoding = 'utf-8'
opt.expandtab = true
opt.hidden = true   -- enable background buffers
opt.hlsearch = false
opt.list = true
opt.mouse = "nv"    -- enable mouse in normal and visual modes
opt.number = true
opt.relativenumber = false
opt.scrolloff = 4
opt.shiftround = true
opt.shiftwidth = 4
opt.sidescrolloff = 8
opt.smartcase = true
opt.smartindent = true
opt.softtabstop = 4
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 4
opt.termguicolors = true
-- opt.wildmode = {'list', 'longest'}  -- command-line completion mode
-- opt.winbar = "%=%m %f"
opt.wrap = false  -- disable line wrap


-- no swap
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true


-- toggle relativenumber
vim.keymap.set("n", "<leader>rn", "<cmd>set invrelativenumber<cr>")
vim.keymap.set("n", "<leader>n", "<cmd>set invnumber invrelativenumber<cr>")

vim.cmd("highlight CursorLine ctermbg=NONE guibg=#1f081f")
vim.cmd("highlight Visual ctermbg=NONE guibg=#12123f")

-- ------------------------------------------------------------
-- telescope mappings
local picker_opts = require('telescope.themes').get_ivy({hidden=true})
vim.keymap.set("n", "<C-f>",
    function()
        require('telescope.builtin').live_grep(picker_opts)
    end
)

vim.keymap.set("n", "<leader>fb", require('telescope.builtin').git_branches)
vim.keymap.set("n", "<leader>fh", require('telescope.builtin').help_tags)

vim.keymap.set("n", "<leader>fc", require('telescope.builtin').commands)
vim.keymap.set("n", "<leader>fr", require('telescope.builtin').resume) -- resume last searching session
vim.keymap.set("n", "<leader>fa", require('telescope.builtin').builtin) -- show me all the builtins
 -- find files across all projects
vim.keymap.set("n", "<leader>fp", "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files,/home/tsmart/work/npsg-internal-tools<CR>")

-- local is_git_repo = function ()
--     return os.execute("git rev-parse --git-dir > /dev/null 2> /dev/null") == 0
-- end
--
--
-- local my_find_files = function (opts)
--     -- try to use git but fall back to regular find files
--     if is_git_repo() then
--         require('telescope.builtin').git_files(opts)
--     else
--         require('telescope.builtin').find_files(opts)
--     end
-- end

-- vim.keymap.set("n", "<C-p>", function() my_find_files(picker_opts) end)
vim.keymap.set("n", "<C-p>", function() require('telescope.builtin').find_files(picker_opts) end)

-- ------------------------------------------------------------
-- terminal mapping
-- vim.keymap.set("n", "<leader>t", "<cmd>h split | terminal<cr><C-\\><C-n>z15<cr>i")
-- vim.keymap.set("t", "<C-w>", "<C-\\><C-n><C-w>") -- forward window commands

-- vim.cmd([[
--     augroup neovim_terminal
--         autocmd!
--         " Enter Terminal-mode (insert) automatically
--         autocmd TermOpen * startinsert
--         " Disables number lines on terminal buffers
--         autocmd TermOpen * :set nonumber norelativenumber
--         " allows you to use Ctrl-c on terminal window
--         autocmd TermOpen * nnoremap <buffer> <C-c> i<C-c>
--     augroup END
-- ]])

require('toggleterm').setup({
    direction = 'float',
    on_open = function ()
        vim.cmd("startinsert")
    end,
})

vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>")
vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm direction=tab<CR>")
vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm size=120 direction=vertical<CR>")
vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm size=15 direction=horizontal<CR>")
vim.keymap.set("t", "<C-w>", "<C-\\><C-n><C-w>") -- forward window commands
vim.keymap.set("t", "<C-e>", "<C-\\><C-n><cmd>ToggleTerm<CR>") -- use ctrl+e to toggle
vim.keymap.set("n", "<C-e>", "<cmd>ToggleTerm<CR>") -- use ctrl+e to toggle

local Terminal  = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd("Closing terminal")
  end,
})

function _lazygit_toggle()
  lazygit:toggle()
end

-- vim.api.nvim_set_keymap("n", "<leader>lg", _lazygit_toggle, {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})


-- ------------------------------------------------------------
-- general keymaps
vim.keymap.set("n", "<leader><leader>e", "<cmd>tabnew ~/.config/nvim/init.lua<cr>")
vim.keymap.set("n", "<leader><leader>l", "<cmd>e ~/.config/nvim/lua<cr>")
vim.keymap.set("n", "<leader><leader>x", "<cmd>so<cr>")
vim.keymap.set("n", "<leader><leader>r", "<cmd>LspRestart<cr><cmd>edit!<cr>")

-- vim.keymap.set("n", "<leader>o", ":tabedit %<cr>")


-- sweet remap for moving blocks of text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- vim.keymap.set("i", "<C-j>", ":m +1<CR>==")
-- vim.keymap.set("i", "<C-k>", ":m -2<CR>==")
-- vim.keymap.set("n", "<leader>j", ":m .+1<CR>==")
-- vim.keymap.set("n", "<leader>k", ":m .-2<CR>==")

-- sweet remap more undo breakpoints
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", "!", "!<c-g>u")
vim.keymap.set("i", "?", "?<c-g>u")
vim.keymap.set("i", "<CR>", "<CR><c-g>u")

-- sweet remap for keeping things centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<c-u>", "<c-u>zz")
vim.keymap.set("n", "<c-d>", "<c-d>zz")


vim.keymap.set("n", "<leader>q", "<cmd>bp<bar>sp<bar>bn<bar>bd<CR>")
-- -- close everything but our current buffer
-- vim.keymap.set("n", "<leader>q", "<cmd>bd!<bar>e#<CR>")
-- -- close everything
-- vim.keymap.set("n", "<leader><leader>q", "<cmd>bd!<CR>")


vim.keymap.set("n", "<leader>u", require('undotree').toggle)

vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")
vim.keymap.set("n", "<leader>gol", "<cmd>CellularAutomaton game_of_life<CR>")

------------------------------------------------------------
-- better mappings for mulptiple windows

-- split windows
vim.keymap.set("n", "<leader>-", "<cmd>split<cr>")
vim.keymap.set("n", "<leader>=", "<cmd>vsplit<cr>")

-- move through windows quicker
vim.keymap.set("n", "<C-J>", "<C-w>j")
vim.keymap.set("n", "<C-K>", "<C-w>k")
vim.keymap.set("n", "<C-H>", "<C-w>h")
vim.keymap.set("n", "<C-L>", "<C-w>l")

vim.keymap.set("t", "<C-J>", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<C-K>", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<C-H>", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<C-L>", "<C-\\><C-n><C-w>l")

-- resize mappings
vim.keymap.set("n", "<C-Down>", "<C-w>-")
vim.keymap.set("n", "<C-Up>", "<C-w>+")
vim.keymap.set("n", "<C-Left>", "<C-w><")
vim.keymap.set("n", "<C-Right>", "<C-w>>")

vim.keymap.set("t", "<C-Down>", "<C-\\><C-n><C-w>-")
vim.keymap.set("t", "<C-Up>", "<C-\\><C-n><C-w>+")
vim.keymap.set("t", "<C-Left>", "<C-\\><C-n><C-w><")
vim.keymap.set("t", "<C-Right>", "<C-\\><C-n><C-w>>")


-- ------------------------------------------------------------
-- zen mode remaps
vim.api.nvim_set_keymap("n", "<leader>z", ":TZFocus<CR>", {})
vim.api.nvim_set_keymap("n", "<leader><leader>z", ":TZAtaraxis<CR>", {})


-- ------------------------------------------------------------
-- harpoon remaps
vim.keymap.set("n", "<leader>ka", require("harpoon.mark").add_file)
vim.keymap.set("n", "<leader>ks", require("harpoon.ui").toggle_quick_menu)
vim.keymap.set("n", "<leader>kp", require("harpoon.ui").nav_prev)
vim.keymap.set("n", "<leader>kn", require("harpoon.ui").nav_next)

vim.keymap.set("n", "<leader>k1", function() require("harpoon.ui").nav_file(1) end)
vim.keymap.set("n", "<leader>k2", function() require("harpoon.ui").nav_file(2) end)
vim.keymap.set("n", "<leader>k3", function() require("harpoon.ui").nav_file(3) end)
vim.keymap.set("n", "<leader>k4", function() require("harpoon.ui").nav_file(4) end)
vim.keymap.set("n", "<leader>k5", function() require("harpoon.ui").nav_file(5) end)

vim.keymap.set("n", "<leader>kr", require("tj").nav_and_run_first_test)  -- run the test
vim.keymap.set("n", "<leader>k<S-R>", function() require("tj").nav_and_run_first_test{strategy = "dap"} end)  -- run the test with debug!

vim.cmd("command! Pytest lua require('tj').open_last_failed_pytest()")

-- ------------------------------------------------------------
-- neotest config
require("neotest").setup({
    quickfix = {
        enabled = true,
        open = false,
    },
    adapters = {
        require("neotest-python")({
            dap = { justMyCode = true },
            runner = "pytest",
            -- -- Returns if a given file path is a test file.
            -- -- NB: This function is called a lot so don't perform any heavy tasks within it.
            -- is_test_file = function(file_path)
                --   ...
                -- end,
            })
        }
    })

vim.keymap.set("n", "<leader>rj", function() require("neotest").run.run(vim.fn.expand("%")) end) -- run file
vim.keymap.set("n", "<leader>r<S-J>", function() require("neotest").run.run({vim.fn.expand("%"), strategy = "dap"}) end) -- run file with debug

vim.keymap.set("n", "<leader>rl", function() require("neotest").run.run() end)  -- run nearest test
vim.keymap.set("n", "<leader>r<S-L>", function() require("neotest").run.run({strategy = "dap"}) end)  -- run nearest test with debug

vim.keymap.set("n", "<leader>rs", function() require("neotest").output.open({ enter = true }) end)
vim.keymap.set("n", "<leader>rm", function() require("neotest").summary.toggle() end)


-- ------------------------------------------------------------
-- copilot config

-- vim.cmd([[
-- let g:copilot_filetypes = {
--     \ 'TelescopeResults': v:false,
--     \ 'TelescopePrompt': v:false,
-- \ }
--
-- imap <silent><script><expr> <Right> copilot#Accept("\<CR>")
-- imap <silent><script><expr> <Left> copilot#Dismiss()
-- imap <silent><script><expr> <S-Right> copilot#Next()
-- imap <silent><script><expr> <S-Left> copilot#Previous()
-- imap <silent><script><expr> <M-Right> copilot#Suggest()
--
-- let g:copilot_no_tab_map = v:true
-- ]])


-- ------------------------------------------------------------
-- Custom commands

-- :w is hard, :W happens all the time
vim.api.nvim_create_user_command("W", "w", {})
-- ctrl-s so I can save with one hand
vim.keymap.set("n", "<C-S>", "<cmd>:w<cr>")


-- ------------------------------------------------------------
-- Trouble mappings
vim.keymap.set("n", "<leader>da", "<cmd>TroubleToggle document_diagnostics<cr>")
vim.keymap.set("n", "<leader>dq", "<cmd>TroubleToggle quickfix<cr>")
