USER = vim.fn.expand('$USER')

-- -- Make sure all the servers are installed (see https://github.com/neovim/nvim-lspconfig/wiki/Automatically-set-up-installed-servers)
------------------------------------------------------------------------------------
local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

local lsp_defaults = lspconfig.util.default_config

-- 1. Set up nvim-lsp-installer first!
lsp_installer.setup {}


require("lsp.handlers").setup()
require("lsp.mason")

