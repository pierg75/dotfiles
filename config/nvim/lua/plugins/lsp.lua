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
			local lspconfig = require("lspconfig")
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
				ensure_installed = { "lua_ls", "clangd", "gopls", "basedpyright" },
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({})
					end,
				},
			})

			-- Python
			lspconfig.basedpyright.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					basedpyright = {
						diagnosticMode = "openFilesOnly",
						typeCheckingMode = "standard",
						useLibraryCodeForTypes = true,
					},
				},
			})

			-- Lua
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- C
			lspconfig.clangd.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- Go
			lspconfig.gopls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end,
	},
}
