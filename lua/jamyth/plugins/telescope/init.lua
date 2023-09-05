local keys = require("jamyth.plugins.telescope.keys")

return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    keys = {
        { '<leader>o', keys.recent_files, },
        { '<leader>ff', keys.find_files, },
        { '<C-p>', keys.git_files, },
        { '<leader>ps', keys.grep_string, },
    },
    config = function()
        local telescope = require('telescope')
        local actions = require('telescope.actions')

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ['<C-c>'] = actions.close,
                    },
                    n = {
                        ['q'] = actions.close,
                        ['<C-c>'] = actions.close,
                    }
                }
            },
            pickers = {
            --    find_files = {
             --       
              --  }
            },
            extensions = {
                ['ui-select'] = {
                    require('telescope.themes').get_ivy({})
                }
            }
        })

        telescope.load_extension('ui-select')
        telescope.load_extension('fzf')
    end,
}
