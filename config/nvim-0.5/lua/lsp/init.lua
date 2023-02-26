USER = vim.fn.expand('$USER')

local status_lspinok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_lspinok then
  return
end

lsp_installer.setup()


require("lsp.handlers").setup()
require("lsp.mason")

