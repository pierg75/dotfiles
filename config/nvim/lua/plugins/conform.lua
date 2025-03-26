return {
	{
		"stevearc/conform.nvim",
		lazy = true,
		opts = {},
		config = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "isort", "ruff_format", "ruff_organize_imports", lsp_format = "fallback" },
					rust = { "rustfmt", lsp_format = "fallback" },
					c = { "clang-format" },
					sh = { "beautysh" },
					["*"] = { "trim_whitespace", "trim_newlines" },
				},
				formatters = {
					ruff_organize_imports = {
						append_args = { "--line-length", "110" },
					},
				},
			})
		end,
	},
}
