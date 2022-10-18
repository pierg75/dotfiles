USER = vim.fn.expand('$USER')

-- -- Make sure all the servers are installed (see https://github.com/neovim/nvim-lspconfig/wiki/Automatically-set-up-installed-servers)
------------------------------------------------------------------------------------
local lsp_installer = require("nvim-lsp-installer")
local lspconfig = require("lspconfig")
local lsp_defaults = lspconfig.util.default_config

-- 1. Set up nvim-lsp-installer first!
lsp_installer.setup {}

-- 2. (optional) Override the default configuration to be applied to all servers.
lspconfig.util.default_config = vim.tbl_extend(
    "force",
    lspconfig.util.default_config,
    {
        on_attach = on_attach
    }
)

lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- 3. Loop through all of the installed servers and set it up via lspconfig
for _, server in ipairs(lsp_installer.get_installed_servers()) do
  lspconfig[server.name].setup {}
end
------------------------------------------------------------------------------------


-- -- Add nice borders to floating windows
------------------------------------------------------------------------------------
vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

local border = {
      {"🭽", "FloatBorder"},
      {"▔", "FloatBorder"},
      {"🭾", "FloatBorder"},
      {"▕", "FloatBorder"},
      {"🭿", "FloatBorder"},
      {"▁", "FloatBorder"},
      {"🭼", "FloatBorder"},
      {"▏", "FloatBorder"},
}

-- LSP settings (for overriding per client)
-- For now let's use the rounded 
local handlers =  {
  ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = 'rounded'}),
  ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = 'rounded' }),
}

-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or 'shadow'
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
------------------------------------------------------------------------------------

-- -- Configure autocompletion with nvim-cmp (see https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion)
------------------------------------------------------------------------------------

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
-- clangd server will be initialised by the clangd_extension plugin
local servers = { 'rust_analyzer', 'pyright', 'bashls' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = lsp_defaults.capabilities,
  }
end

-- Customizing how diagnostics are displayed
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

-- setup diagnostics to show a floating window
vim.api.nvim_create_autocmd({ "CursorHold" }, {
	callback = function()
		if vim.lsp.buf.server_ready() then
			vim.diagnostic.open_float()
		end
	end,
})

-- set up LSP signs
for type, icon in pairs({
	Error = "",
	Warn = "",
	Hint = "",
	Info = "",
}) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
------------------------------------------------------------------------------------
