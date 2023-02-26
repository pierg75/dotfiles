local status_ok, utils = pcall(require, "utils")
if not status_ok then
	return
end

if utils.file_exists('cscope.out') then
  vim.api.nvim_command('cs add cscope.out')
  vim.api.nvim_command('set csto=0')
  vim.api.nvim_command('set cst')
end
