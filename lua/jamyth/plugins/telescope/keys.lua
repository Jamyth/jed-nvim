local M = {}

local opts = {
    layout_strategy = 'vertical',
}

function get_dropdown()
    require('telescope.themes').get_dropdown({
        only_cwd = true,
        layout_strategy = 'center',
        layout_config = { width = 0.6 },
        previewer = false,
    })
end

function M.recent_files()
   local builtin =  require('telescope.builtin')
   builtin.oldfiles(get_dropdown())
end

function M.find_files()
    local builtin = require('telescope.builtin')
    builtin.find_files(get_dropdown())
end

function M.git_files()
    local builtin = require('telescope.builtin')
    builtin.git_files(get_dropdown())
end

function M.grep_string()
    local builtin = require('telescope.builtin')
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end

return M
    
