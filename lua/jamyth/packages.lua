require('lazy').setup({
{
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		vim.cmd([[colorscheme tokyonight-moon]])
	end,
},
	{
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
      dependencies = { 'nvim-lua/plenary.nvim' }
    }
})
