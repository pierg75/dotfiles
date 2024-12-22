local m = {
	"stevearc/conform.nvim",
}

function m.config()
	require("conform").setup({
		formatters_by_ft = {
			-- python = { "isort", "black" },
			c = { "clang-format" },
			sh = { "beautysh" },
			rust = { "rustfmt", lsp_format = "fallback" },
			["*"] = { "trim_whitespace", "trim_newlines" },
		},
		format_on_save = {
			timeout_ms = 3000,
			lsp_format = "fallback",
		},
		--formatters = {
		--	black = {
		--		prepend_args = { '--fast' },
		--	},
		--},
	})
end

return m
