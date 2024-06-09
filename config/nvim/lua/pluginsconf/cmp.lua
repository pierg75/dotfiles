local M = {
	"hrsh7th/nvim-cmp",
	lazy = false,
	priority = 100,
	dependencies = {
		"onsails/lspkind.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
		{
			"L3MON4D3/LuaSnip",
			build = "make install_jsregexp",
			dependencies = {
				"rafamadriz/friendly-snippets",
			},
		},
		"saadparwaiz1/cmp_luasnip",
	},
}

function M.config()
	local lspkind = require "lspkind"
	lspkind.init {}

	local cmp = require "cmp"
	cmp.setup {
		sources = {
			{ name = "nvim_lsp" },
			{ name = "cody" },
			{ name = "path" },
			{ name = "buffer" },
		},
		snippet = {
			expand = function(args)
				vim.snippet.expand(args.body)
			end,
		},
		mapping = {
			["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
			["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
			['<C-y>'] = cmp.mapping(
				cmp.mapping.confirm {
					behavior = cmp.ConfirmBehavior.insert,
					select = true,
				},
				{ "i", "s" }
			),
		},
	}

	-- Set configuration for specific filetype.
	cmp.setup.filetype('gitcommit', {
		sources = cmp.config.sources({
			{ name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
		}, {
			{ name = 'buffer' },
		})
	})
end

return M
