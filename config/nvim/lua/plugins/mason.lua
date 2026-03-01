return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			{ "mason-org/mason-lspconfig.nvim", opts = {} }
		},
		enabled = true,
		config = function()
			local mason = require("mason")

			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
}
