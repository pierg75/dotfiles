return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		priority = 1000,
		enabled = true,
		config = function()
			local lualine = require("lualine")
			lualine.setup({
				options = {
					theme = "ayu_dark",
					section_separators = "",
					component_separators = "",
				},
			})
		end,
	},
}
