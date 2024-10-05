local m = {
	"stevearc/conform.nvim",
}

function m.config()
	require("conform").setup({
		formatters_by_ft = {
			-- python = { "isort", "black" },
			markdown = { "inject" },
			c = { "clang-format" },
			sh = { "beautysh" },
			lua = { "lua-format" },
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
