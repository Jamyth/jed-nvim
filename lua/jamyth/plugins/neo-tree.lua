local function path_copied_message(path)
    return 'Copied the path:\n' .. path
end

return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    keys = {
        {
            '<leader>e',
            function()
                vim.cmd.Neotree('toggle')
            end,
        },
    },
    config = function()
        local neotree = require('neo-tree')
        neotree.setup({
            filesystem = {
                filtered_items = {
                    never_show = {
                        '.DS_Store',
                    },
                },
                follow_current_file = {
                    enabled = true,
                },
            },
            window = {
                position = 'left',
                width = 60,
                mappings = {
                    ['<C-z>'] = 'close_all_nodes',
                    ['c'] = function(state)
                        local node = state.tree:get_node()
                        print(node)
                        vim.fn.setreg('*', node.path, 'c')
                        vim.notify(
                            path_copied_message(node.path),
                            vim.log.levels.INFO,
                            { title = 'neo-tree' }
                        )
                    end,
                },
            },
            close_if_last_window = true,
            enable_git_status = true,
            enable_dianostics = true,
        })
    end,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
    },
}
