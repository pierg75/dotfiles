return {
	{
		"folke/which-key.nvim",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "echasnovski/mini.nvim", version = false },
		},
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
}
