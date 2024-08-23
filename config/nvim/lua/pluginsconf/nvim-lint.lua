local m = {
  "mfussenegger/nvim-lint",
}

function m.config()
	local lint = require("lint")

	lint.linters_by_ft = {
		-- python = { "flake8", "ruff" },
		python = { "flake8" },
		lua = {"luacheck"},
	}

	local lint_augroup = vim.api.nvim_create_augroup("nvim_lint_au", { clear = true })

  -- vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  vim.api.nvim_create_autocmd({ "BufWritePost" }, {
		group = lint_augroup,
		callback = function()
			lint.try_lint()
		end,
	})
end

return m
