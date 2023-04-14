local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

M.setup = function()
	local signs = {

		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
	end

	local config = {
    virtual_text = false,
		signs = {
			active = signs, -- show signs
		},
		update_in_insert = false,
		underline = true,
		severity_sort = false,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})

end

local function lsp_keymaps(bufnr)
  local utils = require('utils')
	utils.map("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr })
	utils.map("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
	utils.map("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
	utils.map("n", "gI", vim.lsp.buf.implementation, { buffer = bufnr })
	utils.map("n", "gr", vim.lsp.buf.references, { buffer = bufnr })
	utils.map("n", "gl", vim.diagnostic.open_float, { buffer = bufnr })
	utils.map("n", "<leader>li", "<cmd>LspInfo<CR>", { buffer = bufnr })
	utils.map("n", "<leader>lI", "<cmd>Mason<CR>", { buffer = bufnr })
	utils.map("n", "<leader>la", vim.lsp.buf.code_action, { buffer = bufnr })
	utils.map("n", "<leader>lj", vim.diagnostic.goto_next({buffer=0}), { buffer = bufnr })
	utils.map("n", "<leader>lk", vim.diagnostic.goto_prev({buffer=0}), { buffer = bufnr })
	utils.map("n", "<leader>lr", vim.lsp.buf.rename, { buffer = bufnr })
	utils.map("n", "<leader>ls", vim.lsp.buf.signature_help, { buffer = bufnr })
	utils.map("n", "<leader>lq", vim.diagnostic.setloclist, { buffer = bufnr })
end

M.on_attach = function(client, bufnr)
	if client.name == "tsserver" then
		client.server_capabilities.documentFormattingProvider = false
	end

	if client.name == "lua_ls" then
		client.server_capabilities.documentFormattingProvider = false
	end

	lsp_keymaps(bufnr)
	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end
	illuminate.on_attach(client)
end

return M
