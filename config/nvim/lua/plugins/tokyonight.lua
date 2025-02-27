return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		enabled = true,
		config = function()
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
}
