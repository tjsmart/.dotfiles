local on_attach = function(client, bufnr)

    -- local function buf_set_keymap(...)
    --     vim.api.nvim_buf_set_keymap(bufnr, ...)
    -- end

    local opts = { noremap = true, silent = true }

    -- -- See `:help vim.lsp.*` for documentation on any of the below functions
    -- -- leaving only what I actually use...
    -- buf_set_keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
    -- buf_set_keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
    --
    -- buf_set_keymap("n", "<C-j>", "<cmd>Telescope lsp_document_symbols<CR>", opts)
    -- buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    --
    -- buf_set_keymap("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
    -- buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    -- buf_set_keymap("n", "<leader>D", "<cmd>Telescope lsp_type_definitions<CR>", opts)
    -- buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    -- buf_set_keymap("n", "<leader>ca", "<cmd>Telescope lsp_code_actions<CR>", opts)
    -- vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0})
    -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})

    -- buf_set_keymap('n', 'gd', vim.lsp.buf.definition, opts)
    -- buf_set_keymap('n', 'gi', vim.lsp.buf.implementation, opts)
    -- buf_set_keymap('n', 'gr', vim.lsp.buf.references, opts)
    -- buf_set_keymap('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, {buffer=0})
    vim.keymap.set("n", "gr", require('telescope.builtin').lsp_references, {buffer=0})

    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
    vim.keymap.set("n", "<leader><S-R>", vim.lsp.buf.rename, {buffer=0})
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {buffer=0})

    vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, {buffer=0})
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {buffer=0})
    vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", {buffer=0})
    vim.keymap.set("n", "<leader>ds", vim.diagnostic.open_float, {buffer=0})

    -- toggle virtual text
    local virtual_text_bool = true
    vim.keymap.set("n", "<leader>dh",
        function()
            virtual_text_bool = not virtual_text_bool
            vim.diagnostic.config{virtual_text = virtual_text_bool}
        end,
        {buffer=0}
    )

    -- buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    -- buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    -- buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    -- buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    -- buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    -- buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    -- buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    -- buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    -- buf_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    -- buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)


    if client.server_capabilities.document_formatting then
        vim.cmd([[
        augroup formatting
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
        autocmd BufWritePre <buffer> lua OrganizeImports(1000)
        augroup END
        ]])
    end

    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.document_highlight then
        vim.cmd([[
        augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]])
    end

end


require'cmp'.setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- lsp_installer.setup{}
local lspconfig = require('lspconfig')

lspconfig.pyright.setup{
    capabilities = capabilities,
    on_attach = on_attach,
}

lspconfig.clangd.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    -- set encoding so it doesn't conflict with copilot :/
    cmd = {
        "clangd",
        "--offset-encoding=utf-16",
    },
}


lspconfig.lua_ls.setup{
    cmd = { "/home/tsmart/Programs/lua-language-server/bin/lua-language-server" },
    settings = {
        Lua = { diagnostics = { globals = { 'vim' } } }
    },
}


lspconfig.rust_analyzer.setup{
    capabilities = capabilities,
    on_attach = on_attach,
}


require'lspconfig'.tsserver.setup{}
