local theme = 'kanagawa-dragon'
local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. theme)

if not status_ok then
    print('colorscheme: ' .. theme .. 'cannot be set')
end
