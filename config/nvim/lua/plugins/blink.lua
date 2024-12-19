return {
	'saghen/blink.cmp',
	lazy = false,
	dependencies = {
		'rafamadriz/friendly-snippets',
		'L3MON4D3/LuaSnip',
		version = 'v2.*'
	},

	version = 'v0.*',
	opts = {
		keymap = { preset = 'default' },

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = 'mono'
		},

		snippets = {
			expand = function(snippet) require('luasnip').lsp_expand(snippet) end,
			active = function(filter)
				if filter and filter.direction then
					return require('luasnip').jumpable(filter.direction)
				end
				return require('luasnip').in_snippet()
			end,
			jump = function(direction) require('luasnip').jump(direction) end,
		},
		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer' },
		},

		completion = {
			accept = {
				auto_brackets = {
					enabled = true
				}
			}
		},

		signature = { enabled = true }

	},
}
