local ft = {
    'less',
    'scss',
    'css',
    'html',
    'lua',
    'typescript',
    'javascript'
}

return {
    'norcalli/nvim-colorizer.lua',
    ft = ft,
    config = function()
        local colorizer = require('colorizer')
        colorizer.setup(ft)
    end,
}
