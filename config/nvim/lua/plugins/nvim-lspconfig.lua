return {
	'neovim/nvim-lspconfig',
	dependencies = {
		'saghen/blink.cmp',
		"folke/lazydev.nvim",
		dependencies = "netmute/ctags-lsp.nvim",
	},

	config = function()
		local lspconfig = require("lspconfig")

		lspconfig.ctags_lsp.setup({})

		for _, server in pairs(require("config.utils").servers) do
			local cap = require('blink.cmp').get_lsp_capabilities()
			lspconfig[server].setup { capabilites = cap }
		end
	end
}
