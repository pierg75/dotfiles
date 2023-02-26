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
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		virtual_text = false, -- disable virtual text
		signs = {
			active = signs, -- show signs
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
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
	utils.map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
	utils.map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
	utils.map("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>")
	utils.map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
	utils.map("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>")
	utils.map("n", "<leader>li", "<cmd>LspInfo<cr>")
	utils.map("n", "<leader>lI", "<cmd>Mason<cr>")
	utils.map("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>")
	utils.map("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>")
	utils.map("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>")
	utils.map("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>")
	utils.map("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
	utils.map("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>")
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
