
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'kyazdani42/nvim-web-devicons'

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Configurations for Nvim LSP
    use 'neovim/nvim-lspconfig'

    -- Load colorscheme plugins
    use { 'catppuccin/nvim', as = 'catppuccin' , version = 'v0.2.2' }
    use 'pineapplegiant/spaceduck'
    use 'folke/tokyonight.nvim'
    use 'EdenEast/nightfox.nvim'
    use 'ellisonleao/gruvbox.nvim'
    use 'Mofiqul/dracula.nvim'
    use { 'rose-pine/neovim', as = 'rose-pine' }

    -- comments!
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        version = '2ac8d77575926d5c22f1d13f3e48000d579277e3',
    }

    -- nvim-comp
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'

    -- lsp function signatures
    use 'ray-x/lsp_signature.nvim'

    -- luasnip
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    -- telescope
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'BurntSushi/ripgrep'

    -- treesitter
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/nvim-treesitter-context'

    -- debugging
    use 'mfussenegger/nvim-dap'
    use 'mfussenegger/nvim-dap-python'
    use 'rcarriga/nvim-dap-ui'

    -- formatting
    use 'mhartington/formatter.nvim'

    -- file tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    -- zen
    use({
        "Pocco81/true-zen.nvim",
        config = function()
            require("true-zen").setup {}
        end,
    })

    use {
    'lewis6991/gitsigns.nvim',
    -- tag = 'release' -- To use the latest release
    }

    use {'akinsho/toggleterm.nvim', tag = 'v2.*'}

    -- vertical 'f'-like movement via 's'
    use 'justinmk/vim-sneak'

    -- better tab things
    use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('bufferline').setup{
                options = {
                    mode = "tabs", -- set to "tabs" to only show tabpages instead
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "File Explorer",
                            highlight = "Directory",
                            separator = true -- use a "true" to enable the default, or set your own character
                        }
                    }
                }
            }
        end
    }

    -- harpoon!!
    use 'ThePrimeagen/harpoon'

    -- neotest
    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim"
        }
    }
    use 'nvim-neotest/neotest-python'

    -- highlight various keywords in comments
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
    }

    -- undotree
    use {
        "jiaoshijie/undotree",
        config = function()
            require('undotree').setup()
        end,
        requires = {
            "nvim-lua/plenary.nvim",
        },
    }

    -- -- copilot
    -- use "github/copilot.vim"

    -- I probably don't need this but it makes me happy
    use 'eandrju/cellular-automaton.nvim'

    -- pretty diagnostics
    use 'folke/trouble.nvim'
end)
