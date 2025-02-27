return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},

		config = function()
			local fzf = require("fzf-lua")
			fzf.setup({
				"skim",
				grep = {
					rg_opts = "--sort-files --hidden --column --line-number --no-heading "
						.. "--color=always --smart-case -g '!{.git,node_modules}/*'",
					git_icons = false,
					file_icons = false,
					actions = {
						["ctrl-i"] = { require("fzf-lua.actions").toggle_ignore },
						["ctrl-q"] = {
							fn = require("fzf-lua.actions").file_edit_or_qf,
							prefix = "select-all+",
						},
					},
				},
			})
		end,
	},
}
