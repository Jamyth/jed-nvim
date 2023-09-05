return {
    'nvimdev/guard.nvim',
    event = { 'BufReadPre' },
    config = function()
        local guard = require('guard')
        local ft = require('guard.filetype')
        local formatter = require('guard.format')

        ft('lua'):fmt('stylua')
        ft('typescript,javascript,typescriptreact'):fmt('prettier')

        guard.setup({
            fmt_on_save = true,
            lsp_as_default_formatter = false,
        })

        vim.keymap.set('n', '<leader>f', function()
            local bufnr = vim.api.nvim_get_current_buf()
            formatter.do_fmt(bufnr)
        end)
    end,
}
