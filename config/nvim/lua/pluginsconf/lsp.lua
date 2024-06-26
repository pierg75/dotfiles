local M = {
	"neovim/nvim-lspconfig",
	lazy = true,
	dependencies = {
		{
			"hrsh7th/cmp-nvim-lsp",
		},
		-- Additional lua configuration, makes nvim stuff amazing!
		{
			'folke/neodev.nvim',
		},
		{
			'j-hui/fidget.nvim',
			opts = {}
		},
	},
}

local cmp_nvim_lsp = require "cmp_nvim_lsp"
function M.config()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

	local function lsp_keymaps(bufnr)
		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
		vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
		vim.keymap.set("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
		vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
		vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
		vim.keymap.set("n", "<Leader>li", "<cmd>LspInfo<cr>", opts)
		vim.keymap.set("n", "<Leader>lI", "<cmd>Mason<cr>", opts)
		vim.keymap.set("n", "<Leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
		vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
		vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
		vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
		vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
		vim.keymap.set("n", "<Leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		vim.keymap.set("n", "<Leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
		vim.keymap.set("n", "<Leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	end

	local lspconfig = require "lspconfig"
	local on_attach = function(client, bufnr)
		if client.name == "tsserver" then
			client.server_capabilities.documentFormattingProvider = false
		end

		if client.name == "sumneko_lua" then
			client.server_capabilities.documentFormattingProvider = false
		end

		lsp_keymaps(bufnr)
		require "lsp_signature".on_attach({}, bufnr) -- Note: add in lsp client on-attach
	end

	for _, server in pairs(require("utils").servers) do
		Opts = {
			on_attach = on_attach,
			capabilities = capabilities,
		}

		server = vim.split(server, "@")[1]

		local require_ok, conf_opts = pcall(require, "settings." .. server)
		if require_ok then
			Opts = vim.tbl_deep_extend("force", conf_opts, Opts)
		end

		lspconfig[server].setup(Opts)
	end

	lspconfig['clangd'].setup({
		root_dir = function(fname)
			return require("lspconfig.util").root_pattern(
				"Makefile",
				"configure.ac",
				"configure.in",
				"config.h.in",
				"meson.build",
				"meson_options.txt",
				"build.ninja"
			)(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
				fname
			) or require("lspconfig.util").find_git_ancestor(fname)
		end,
		capabilities = {
			offsetEncoding = { "utf-16" },
		},
		cmd = {
			"clangd",
			"--background-index",
			"--clang-tidy",
			"--header-insertion=iwyu",
			"--completion-style=detailed",
			"--function-arg-placeholders",
			"--fallback-style=llvm",
		},
		init_options = {
			usePlaceholders = true,
			completeUnimported = true,
			clangdFileStatus = true,
		},
		on_attach = on_attach
	})


	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		virtual_text = false,
		-- show signs
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
			suffix = "",
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

return M
