local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function ()
	  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>o', builtin.oldfiles)

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ['<C-c>'] = actions.close
            },
            n = {
                ['q'] = actions.close,
                ['<C-c>'] = actions.close,
            }
        }
    }
})
