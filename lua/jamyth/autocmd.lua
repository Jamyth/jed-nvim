-- Restore cursor position
local preserve_cursor_position_group =
    vim.api.nvim_create_augroup('preserve_cursor_position_group', {})
vim.api.nvim_create_autocmd({ 'BufReadPost' }, {
    pattern = { '*' },
    group = preserve_cursor_position_group,
    callback = function()
        vim.api.nvim_exec('silent! normal! g`"zv', false)
        vim.fn.timer_start(1, function()
            vim.api.nvim_exec('silent! normal! zz', false)
        end)
    end,
})

-- Automatically Split Help window to the left
vim.cmd([[
    augroup help_window_to_left
        autocmd!
        autocmd FileType help wincmd L
    augroup END
]])

-- Show Neotree on startup
local show_neotree_on_startup = vim.api.nvim_create_augroup('show_neotree_on_startup', {})
vim.api.nvim_create_autocmd('VimEnter', {
    group = show_neotree_on_startup,
    callback = function()
        vim.cmd.Neotree('toggle')
    end,
})

-- auto reload file if checked
local auto_reload_group = vim.api.nvim_create_augroup('auto_reload_group', {})
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHoldI', 'CursorHold' }, {
    pattern = { '*' },
    group = auto_reload_group,
    callback = function()
        vim.cmd.checktime()
    end,
})
