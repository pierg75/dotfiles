return {
	"saghen/blink.cmp",
	version = "*",
	lazy = false,
	dependencies = {
		"rafamadriz/friendly-snippets",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
		},
	},

	opts = {
		keymap = { preset = "default" },

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},

		snippets = {
			preset = "luasnip",
		},
		sources = {
			default = { "snippets", "lsp", "path", "buffer", "markdown" },
			providers = {
				markdown = {
					name = "RenderMarkdown",
					module = "render-markdown.integ.blink",
					fallbacks = { "lsp" },
				},
			},
		},
		signature = {
			window = { border = "single" },
			enabled = true,
		},
		cmdline = {
			enabled = false,
		},
		fuzzy = {
			implementation = "prefer_rust_with_warning",
		},
		completion = {
			menu = {
				scrollbar = false,
				auto_show = true,
				border = "rounded",
			},
			documentation = {
				window = {
					border = "rounded",
				},
			},
			ghost_text = {
				enabled = true,
			},
			accept = {
				auto_brackets = {
					enabled = true,
				},
			},
		},
	},
	opts_extend = { "sources.default" },
}
