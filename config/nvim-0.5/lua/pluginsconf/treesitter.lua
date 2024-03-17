local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "BufReadPost",
	dependencies = {
		{
			"nvim-tree/nvim-web-devicons",
			event = "VeryLazy",
		},
	},
}
function M.config()
	local treesitter = require "nvim-treesitter"
	local configs = require "nvim-treesitter.configs"

	configs.setup {
		ensure_installed = { "lua", "luadoc", "markdown", "markdown_inline", "bash",
			"python", "rust", "toml", "c", "cpp", "go", "vim", "diff", "regex", "yaml",
			"vimdoc" },          -- put the language you want in this array
		ignore_install = { "" }, -- List of parsers to ignore installing
		sync_install = false,  -- install languages synchronously (only applied to `ensure_installed`)
		-- Automatically install missing parsers when entering buffer
		-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
		auto_install = true,

		highlight = {
			enable = true,    -- false will disable the whole extension
			additional_vim_regex_highlighting = false,
			disable = { "css" }, -- list of language that will be disabled
		},
		autopairs = {
			enable = true,
		},
		indent = {
			enable = true,
			disable = { "css" }
		},
	}
end

return M
