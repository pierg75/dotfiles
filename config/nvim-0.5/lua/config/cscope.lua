utils = require('utils')

if utils.file_exists('cscope.out') then
  vim.api.nvim_command('cs add cscope.out')
end
