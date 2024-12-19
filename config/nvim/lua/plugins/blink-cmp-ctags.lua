vim.opt.tags:append({ ".git/tags", "tags" })

return {
    "saghen/blink.cmp",
    dependencies = {
        "netmute/blink-cmp-ctags",
    },
    opts = {
        sources = {
            providers = {
                -- Add the ctags provider
                ctags = {
                    name = "Ctags",
                    module = "blink-cmp-ctags",
                    fallback_for = { "lsp" },
                },
            },
            completion = {
                -- Add ctags to the list
                enabled_providers = { "lsp", "path", "snippets", "buffer", "ctags" },
            },
        },
    },
}
