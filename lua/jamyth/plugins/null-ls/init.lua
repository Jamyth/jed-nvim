local format = require('jamyth.util.format')

return {
    'jose-elias-alvarez/null-ls.nvim',
    event = 'BufRead',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function()
        local null_ls = require('null-ls')

        local eslint = require('jamyth.plugins.null-ls.eslint')
        local prettier_d = require('jamyth.plugins.null-ls.prettier')
        local stylelint = require('jamyth.plugins.null-ls.stylelint')

        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics
        local code_actions = null_ls.builtins.code_actions

        null_ls.setup {
            debug = true,
            sources = {
                -- Lua
                formatting.stylua,

                -- JS, why JS have so many things to setup, it sucks
                prettier_d.create_prettier_source('formatting'),
                eslint.create_eslint_d_source('formatting'),
                eslint.create_eslint_d_source('diagnostics'),
                eslint.create_eslint_d_source('code_actions'),
                stylelint.create_stylelint_source('formatting'),
                stylelint.create_stylelint_source('diagnostics'),
            },
            -- add should_attach function to attach lsp server only on specific filetype
        }
    end,
}
