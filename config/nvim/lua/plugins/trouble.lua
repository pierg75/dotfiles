local M = {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
}

function M.config()
	require("trouble").setup({
		modes = {
			cascade = {
				mode = "diagnostics", -- inherit from diagnostics mode
				filter = function(items)
					local severity = vim.diagnostic.severity.HINT
					for _, item in ipairs(items) do
						severity = math.min(severity, item.severity)
					end
					return vim.tbl_filter(function(item)
						return item.severity == severity
					end, items)
				end,
			},
		},
	})
end

return M