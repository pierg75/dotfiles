local M = {
	'mrcjkb/rustaceanvim',
  version = '^5',				-- Recommended
  lazy = false,					-- This plugin is already lazy
}


function M.config()
	require("conform").setup({
	})
end

return M
