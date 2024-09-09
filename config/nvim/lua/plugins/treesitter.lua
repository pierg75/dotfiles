local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
}

function M.config()
	local configs = require "nvim-treesitter.configs"
	configs.setup {
		highlight = {
			enable = true,
		},
		-- enable indentation
		indent = { enable = true },
		-- enable autotagging (w/ nvim-ts-autotag plugin)
		autotag = {
			enable = true,
		},
		-- ensure these language parsers are installed
		ensure_installed = {
			"json",
			"yaml",
			"markdown",
			"markdown_inline",
			"bash",
			"lua",
			"luadoc",
			"vim",
			"vimdoc",
			"gitignore",
			"c",
			"python",
			"go",
			"rust",
			"toml",
			"diff",
			"regex",
		},
		-- These are necessary to avoid a false positive
		modules = {},
		sync_install = false,
		auto_install = false,
		ignore_install = {},
		parser_install_dir = nil,
		--
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-space>",
				node_incremental = "<C-space>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		}
	}
end

return M
