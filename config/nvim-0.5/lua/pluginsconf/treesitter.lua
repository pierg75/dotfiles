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
			enable = true, -- false will disable the whole extension
			additional_vim_regex_highlighting = false,
			disable = function(lang, buf)
				local max_filesize = 100 * 1024 -- 100 KB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,
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
