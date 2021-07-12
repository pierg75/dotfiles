local nvim_lsp = require('lspconfig')
local nvim_compe = require('compe')

-- Your custom attach function for nvim-lspconfig goes here.
local on_attach = function(client, bufnr)
end

-- LSPs
local servers = { "bashls", "ccls", "clangd", "html" }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup { 
        on_attach = on_attach;
    }
end

nvim_lsp.pyls.setup{
  on_attach = on_attach,
  settings = {
    pyls = {
      plugins = {
        flake8 = {enabled = false},
        pylint = {enabled = true, executable = "pylint-3"},
        pyflakes = {enabled = false},
        pycodestyle = {enabled = true},
        jedi_completion = {fuzzy = true},
        pyls_isort = {enabled = true},
        pyls_mypy = {enabled = true}
      }
    }
  },
  flags = {
    debounce_text_changes = 500,
  }
}

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)
