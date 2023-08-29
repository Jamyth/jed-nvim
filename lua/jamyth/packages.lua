require('lazy').setup({
	"rebelot/kanagawa.nvim",
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		lazy = false,
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		'nvim-treesitter/nvim-treesitter', 
		build = ':TSUpdate'
	}
})
