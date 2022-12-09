-- nvim-tree shortcuts
local status_ok, utils = pcall(require, "utils")
if not status_ok then
	return
end

utils.map('n', '<C-n>', ':Neotree toggle<CR>', {noremap = true, silent = true})

local status_ok, neotree = pcall(require, "neo-tree")
if not status_ok then
	return
end

