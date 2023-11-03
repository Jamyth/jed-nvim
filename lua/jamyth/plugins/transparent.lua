return {
    'xiyaowong/transparent.nvim',
    lazy = false,
    config = function()
        require('transparent').clear_prefix('NeoTree')
        require('transparent').clear_prefix('lualine')
    end,
}
