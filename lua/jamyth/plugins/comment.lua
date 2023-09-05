return {
    'numToStr/Comment.nvim',
    keys = { 
        { 'gc', mode = { 'n', 'v' } }
    },
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'JoosepAlviste/nvim-ts-context-commentstring',
    },
    config = function()
        local comment = require('Comment')
        comment.setup({
            pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
        })
    end
}
