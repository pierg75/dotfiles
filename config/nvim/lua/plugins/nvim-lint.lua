local M = {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
}

function M.config()
	local lint = require("lint")

	lint.linters_by_ft = {
    python = { "pylint" },
		lua = {"luacheck"},
	}

	local lint_augroup = vim.api.nvim_create_augroup("nvim_lint_au", { clear = true })

  vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
		group = lint_augroup,
		callback = function()
			lint.try_lint()
		end,
	})

	vim.keymap.set("n", "<leader>l", function()
		lint.try_lint()
	end, { desc = "Trigger linting for current file" })
end

return M
