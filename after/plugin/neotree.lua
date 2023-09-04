local neotree = require('neo-tree');

vim.keymap.set("n", "<leader>e", function() vim.cmd.Neotree('toggle') end)

neotree.setup({
    filesystem = {
        filtered_items = {
            never_show = { -- remains hidden even if visisble is toggled to true
                '.DS_Store',
            }
        },
        follow_current_file = {
            enabled = true,
        },
    },
    window = {
        position = 'left',
        width = 60,
    },
    close_if_last_window = true,
    enable_git_status = true,
    enable_dianostics = true
})
