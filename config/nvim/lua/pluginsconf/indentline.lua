local M = {
  "lukas-reineke/indent-blankline.nvim",
	main = "ibl",
  event = "BufReadPre",
}

function M.config()
	local status_ok, indent = pcall(require, "ibl")
	if not status_ok then
		return
	end
	indent.setup {}
end

return M
