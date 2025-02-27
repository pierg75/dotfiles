return {
	{
	"lewis6991/gitsigns.nvim",
	event = "BufReadPre",
		config = function()
			local gitsigns = require("gitsigns")
			gitsigns.setup({})
		end
	},
}
