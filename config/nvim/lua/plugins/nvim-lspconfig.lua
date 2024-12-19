
-- LSP servers and clients communicate which features they support through "capabilities".
--  By default, Neovim supports a subset of the LSP specification.
--  With blink.cmp, Neovim has *more* capabilities which are communicated to the LSP servers.
--  Explanation from TJ: https://youtu.be/m8C0Cq9Uv9o?t=1275
--
-- This can vary by config, but in general for nvim-lspconfig:


return {
  'neovim/nvim-lspconfig',
  dependencies = { 'saghen/blink.cmp' },

  config = function(_, opts)
    local lspconfig = require('lspconfig')

    local keymap = vim.keymap -- for conciseness

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }
        -- set keybinds
        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>lua vim.lsp.buf.references()<CR>", opts) -- show lsp definitions, references

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts) -- show lsp definitions

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- show lsp implementations

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition<CR>", opts) -- show lsp type definitions

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
      end,
    })

		local on_attach = function(client, bufnr)
			if client.name == "tsserver" then
				client.server_capabilities.documentFormattingProvider = false
			end
			require "lsp_signature".on_attach({}, bufnr) -- Note: add in lsp client on-attach
		end

		for _, server in pairs(require("config.utils").servers) do
			local Opts = {
				on_attach = on_attach,
				capabilities = require('blink.cmp').get_lsp_capabilities(),
			}

			server = vim.split(server, "@")[1]

			local require_ok, conf_opts = pcall(require, "settings." .. server)
			if require_ok then
				Opts = vim.tbl_deep_extend("force", conf_opts, Opts)
			end
			lspconfig[server].setup(Opts)
		end
	end
}




