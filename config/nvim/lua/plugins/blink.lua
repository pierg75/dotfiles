return {
	"saghen/blink.cmp",
	version = "*",
	lazy = false,
	event = "LspAttach",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"L3MON4D3/LuaSnip",
	},

	opts = {
		keymap = { preset = "default" },

		appearance = {
			use_nvim_cmp_as_default = false,
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
				draw = {
					columns = { { "kind_icon" }, { "label", "kind", "source_name", gap = 1 } },
					align_to = "none",
					components = {
						label = { width = { min = 20, fill = true } }, -- default is true
						label_description = { width = { fill = true } },
						kind = {
							width = { fill = true },
							text = function(ctx)
								return "" .. ctx.kind .. ""
							end,
						},
						source_name = {
							width = { fill = true },
							text = function(ctx)
								return "[" .. ctx.source_name .. "]"
							end,
						},
					},
				},
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
