local m = {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
}

function m.config()
	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			c = { "clang-format" },
			sh = { "beautysh" },
			rust = { "rustfmt", lsp_format = "fallback" },
			["*"] = { "trim_whitespace", "trim_newlines" },
		},
		format_on_save = {
			timeout_ms = 3000,
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
		formatters = {
			black = {
				prepend_args = { '--fast' },
			},
		},
	})
end

return m
