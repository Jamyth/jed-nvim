local M = {}

function M.keymaps(bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gk', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'ge', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', 'rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>k', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '<leader>le', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', '<leader>ne', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<leader>lc', vim.lsp.buf.code_action, opts)
end

function M.illuminate(client)
    require('illuminate').on_attach(client)
end

return M
