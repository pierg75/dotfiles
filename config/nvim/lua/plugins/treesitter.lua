return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = false,
		enabled = true,
		config = function()
			local configs = require("nvim-treesitter")

			configs.install({
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"elixir",
					"heex",
					"javascript",
					"python",
					"go",
					"rust",
					"toml",
					"diff",
					"regex",
					"json",
					"yaml",
					"gitignore",
				})

			configs.setup({
				select = {
					lookahead = true,
				},
				move = {
					set_jumps = true,
				}
			})
		end,
	},
}
