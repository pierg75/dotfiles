local M = {
	'simrat39/rust-tools.nvim',
  dependencies = {
    {
			'neovim/nvim-lspconfig',
    },
  },
}

function M.config()
	require("rust-tools").setup {
		server = {
			on_attach = function(_, bufnr)
				-- Hover actions
				vim.keymap.set("n", "<C-space>", require("rust-tools").hover_actions.hover_actions, { buffer = bufnr })
				-- Code action groups
				vim.keymap.set("n", "<Leader>a", require("rust-tools").code_action_group.code_action_group, { buffer = bufnr })
			end,
		},
	}
end

return M
