return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
			{ "williamboman/mason-lspconfig.nvim" },
			{ "saghen/blink.cmp" },
			{ "williamboman/mason.nvim", config = true },
			{ "williamboman/mason-lspconfig.nvim" },
			{
				"WhoIsSethDaniel/mason-tool-installer.nvim",
				{
					"j-hui/fidget.nvim",
					opts = {},
				},
			},
			{ "netmute/ctags-lsp.nvim" },
		},
		config = function()
			local mason_lspconfig = require("mason-lspconfig")
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			local capabilities = vim.tbl_deep_extend(
				"force",
				capabilities,
				require("blink.cmp").get_lsp_capabilities({
					textDocument = {
						completion = {
							completionItem = {
								snippetSupport = true,
							},
						},
					},
					workspace = {
						didChangeWatchedFiles = {
							relativePatternSupport = true,
						},
					},
				})
			)

			local on_attach = function(client, bufnr)
				vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })
				client.server_capabilities.document_formatting = true
			end

			mason_lspconfig.setup({
				automatic_installation = false,
				ensure_installed = { "lua_ls", "clangd", "gopls", "basedpyright", "ruff" },
				handlers = {
					function(server_name)
						 vim.lsp.config(server_name)
					end,
				},
			})

			-- Python
			vim.lsp.config("basedpyright", {
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					basedpyright = {
						analysis = {
							typeCheckingMode = "basic",
							ignore = { "*" },
						},
						disableOrganizeImports = true,
						-- diagnosticMode = "openFilesOnly",
						-- typeCheckingMode = "standard",
						-- useLibraryCodeForTypes = true,
					},
				},
			})

			vim.lsp.config("ruff", {
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					init_options = {
						settings = {
							logLevel = "error",
						},
					},
				},
			})

			-- Lua
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			-- C
			vim.lsp.config("clangd", {
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- Go
			vim.lsp.config("gopls", {
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end,
	},
}
