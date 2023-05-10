local M = {
	'simrat39/rust-tools.nvim',
  dependencies = {
    {
			'neovim/nvim-lspconfig',
    },
  },
}


function M.config()
	local status_ok, rt = pcall(require, "rust-tools")
	if not status_ok then
		return
	end
	rt.setup {
		server = {
			on_attach = function(_, bufnr)
				-- Hover actions
				vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
				-- Code action groups
				vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
				vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", { buffer = bufnr })
				vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { buffer = bufnr })
				vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { buffer = bufnr })
				vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { buffer = bufnr })
				vim.keymap.set("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", { buffer = bufnr })
				vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { buffer = bufnr })
			end,
		},
		settings = {
			["rust-analyzer"] = {
				rustfmt = {
					overrideCommand = { "rustfmt", "--edition", "2021" },
				},
				checkOnSave = {
					allFeatures = true,
					overrideCommand = {
						"cargo",
						"clippy",
						"--workspace",
						"--message-format=json",
						"--all-targets",
						"--all-features",
					},
				},
			},
		},
		tools = {
			executor = require("rust-tools/executors").termopen, -- can be quickfix or termopen
			reload_workspace_from_cargo_toml = true,
			inlay_hints = {
				auto = true,
				only_current_line = false,
				show_parameter_hints = true,
				parameter_hints_prefix = "<-",
				other_hints_prefix = "=>",
				max_len_align = false,
				max_len_align_padding = 1,
				right_align = false,
				right_align_padding = 7,
				highlight = "Comment",
			},
		},
	}
end

return M
