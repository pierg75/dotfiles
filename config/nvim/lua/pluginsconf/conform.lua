local m = {
	"stevearc/conform.nvim",
}

function m.config()
	require("conform").setup({
		formatters_by_ft = {
			python = { "black" },
			markdown = { "inject" },
			c = { "clang-format" },
			sh = { "beautysh" },
			lua = { "lua_format" },
			["*"] = { "trim_whitespace", "trim_newlines" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
	})
end

return m
