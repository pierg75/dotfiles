local M = {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- calling `setup` is optional for customization
}


function M.config()
	require("fzf-lua").setup({
		'skim',
		keymap = {
			fzf = {
				['ctrl-a'] = 'toggle-all',
				['ctrl-q'] = 'select-all+accept',
			},
		},
		winopts = {
			preview = { default = 'bat_native' }
		},
		grep = {
			rg_opts = "--sort-files --hidden --column --line-number --no-heading " ..
					"--color=always --smart-case -g '!{.git,node_modules}/*'",
			git_icons = false,
			file_icons = false,
		},
		live_grep = {
			git_icons = false,
			file_icons = false,
		},
		global_resume = true,
		keymap = {
			builtin = {
				["ctrl-u"] = "half-page-up",
				["ctrl-d"] = "half-page-down",
				["<C-f>"] = "preview-page-down",
				["<C-b>"] = "preview-page-up",
				["<C-a>"] = "toggle-all",
			},
			fzf = {
				["ctrl-u"] = "half-page-up",
				["ctrl-d"] = "half-page-down",
				["ctrl-f"] = "preview-page-down",
				["ctrl-b"] = "preview-page-up",
				["ctrl-a"] = "toggle-all",
			},
		},
		blines = {
			fzf_opts = {
				['--no-multi'] = false,
				['--multi'] = true,
			}
		},
	})
end

return M
