return {
	{
		"serhez/teide.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd([[colorscheme teide-darker]])
		end,
	},
}
