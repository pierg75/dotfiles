return {
	'saghen/blink.cmp',
	lazy = false,
	dependencies = {
		'rafamadriz/friendly-snippets',
		'L3MON4D3/LuaSnip',
		version = '*'
	},

	version = '*',
	opts = {
		keymap = { preset = 'default' },

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = 'mono'
		},

		snippets = {
			preset = 'luasnip',
		},
		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer' },
		},
		signature = {
			window = { border = 'single' },
			enabled = true
		},
		cmdline = {
		  enabled = false,
		},
		completion = {
			menu = {
				auto_show = true,
				border = 'single',
			},
			documentation = {
				window = {
					border = 'padded'
				}
			},
			ghost_text = {
				enabled = true
			},
		},
	},
	opts_extend = { "sources.default" }
}
