local python_formatter_dir = "~/.virtualenvs/formatters/bin/"

-- Provides the Format and FormatWrite commands
require("formatter").setup {
    -- Enable or disable logging
    logging = true,
    -- Set the log level
    log_level = vim.log.levels.WARN,
    -- All formatter configurations are opt-in
    filetype = {
        python = {
            function() return { exe = python_formatter_dir.."black", } end,
            function() return {
                exe = python_formatter_dir.."reorder-python-imports",
                args = { "--exit-zero-even-if-changed", }
            } end,
        },

        cpp = {
            function() return { exe = "clang-format", args = { "-i" }, } end,
        },

        rust = {
            function() return { exe = "rustfmt", } end,
        },

        typescript = {
            function() return { exe = "prettier", args = {"--write"}, } end,
        },
        typescriptreact = {
            function() return { exe = "prettier", args = {"--write"}, } end,
        },
        javascript = {
            function() return { exe = "prettier", args = {"--write"}, } end,
        },
        javascriptreact = {
            function() return { exe = "prettier", args = {"--write"}, } end,
        },

        -- -- Use the special "*" filetype for defining formatter configurations on
        -- -- any filetype
        -- ["*"] = {
        --     -- "formatter.filetypes.any" defines default configurations for any
        --     -- filetype
        --     require("formatter.filetypes.any").remove_trailing_whitespace
        -- }
    }
}


-- Format on save
vim.cmd([[
    augroup FormatAutogroup
      autocmd!
      autocmd BufWritePost * FormatWrite
    augroup END
]])
