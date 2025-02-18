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
			-- Disable blink to take over the cmdline completion, I prefer the original way
		},
		cmdline = {
			sources = {}
		},
		signature = {
			window = { border = 'single' },
			enabled = true
		},
		completion = {
			accept = {
				auto_brackets = {
					enabled = true
				}
			},
			menu = {
				auto_show = true,
				border = 'single',
				draw = {
					treesitter = { 'lsp' }
				},
			},
			documentation = {
				window = {
					border = 'single'
				}
			},
			ghost_text = {
				enabled = false
			},
		},
	},
	opts_extend = { "sources.default" }
}
