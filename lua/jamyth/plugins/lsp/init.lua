local servers = require('jamyth.plugins.lsp.servers')
return {
    {
        'williamboman/mason.nvim',
        cmd = 'Mason',
        build = ':MasonUpdate',
        config = true,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = { 'williamboman/mason.nvim' },
        opts = {
            ensure_installed = servers.ensure_installed_servers,
            automatic_installation = true,
        },
    },
    {
        'j-hui/fidget.nvim',
        tag = 'legacy',
        opts = {
            text = {
                spinner = 'moon',
            },
            align = {
                bottom = true,
            },
            window = {
                relative = 'editor',
            },
        },
    },
    {
        'ray-x/lsp_signature.nvim',
        enabled = false,
        opts = {
            bind = true, -- This is mandatory, otherwise border config won't get registered.
            floating_window = false,
            hint_enable = true, -- virtual hint enable
            handler_opts = {
                border = 'rounded',
            },
        },
    },
    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            -- Tools
            'RRethy/vim-illuminate',
            'ray-x/lsp_signature.nvim',
            'j-hui/fidget.nvim',
            'lukas-reineke/lsp-format.nvim', --

            -- advance lsp
            'pmizio/typescript-tools.nvim',
            { 'folke/neodev.nvim', config = true },
        },
        config = function()
            require('jamyth.plugins.lsp.lspconfig')
        end,
    },
}
