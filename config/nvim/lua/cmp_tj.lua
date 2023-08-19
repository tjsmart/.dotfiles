-- no clue what this does
vim.opt.completeopt = "menu,menuone,noselect"

-- Setup nvim-cmp.
local cmp = require('cmp')

cmp.setup({

    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },

    -- window = {
    --     -- completion = cmp.config.window.bordered(),
    --     -- documentation = cmp.config.window.bordered(),
    -- },

    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-s>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- select true will grab first suggestion
    }),

    sources = {
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer', keyword_length = 5 },
        { name = 'path' },
    },

    -- formatting = {
    --     format = lspkind.cmp_format {
    --         with_text = true,
    --         menu = {
    --
    --         }
    --     }
    -- }

    experimental = {
        native_menu = false,
        ghost_text = true,
    },

})

-- -- Set configuration for specific filetype.
-- cmp.setup.filetype('gitcommit', {
--     sources = cmp.config.sources({
--         { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
--     }, {
--         { name = 'buffer' },
--     })
-- })

