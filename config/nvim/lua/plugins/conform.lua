return {
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "isort", "black" },
					rust = { "rustfmt", lsp_format = "fallback" },
					c = { "clang-format" },
					sh = { "beautysh" },
					["*"] = { "trim_whitespace", "trim_newlines" },
				},
				formatters = {
					black = {
						prepend_args = { "--fast" },
					},
				},
			})
		end,
	},
}
