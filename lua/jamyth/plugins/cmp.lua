
local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
end

return {
    'hrsh7th/nvim-cmp',
    event = { 'InsertEnter', 'TextChangedI', 'CmdlineEnter' },
    dependencies = {
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-path' }, -- path completion
        { 'hrsh7th/cmp-buffer' }, -- search completion
        { 'hrsh7th/cmp-cmdline' }, -- cmd completion
        { 'saadparwaiz1/cmp_luasnip' }, -- snippet completion
    },
    config = function()
        local cmp = require('cmp')
        
        cmp.setup({
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = {
                ['<up>'] = cmp.mapping.select_prev_item(),
                ['<down>'] = cmp.mapping.select_next_item(),
                ['<cr>'] = cmp.mapping.confirm { select = true },
                ['<c-space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            },
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            }, {
                { name = 'path' },
            }, {
                { name = 'buffer' },
            }),
        })
    end
}
