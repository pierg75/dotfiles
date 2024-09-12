local M = {
    {
        'L3MON4D3/LuaSnip',
        conifg = function(opts)
            require('luasnip').setup(opts)
            require('luasnip.loaders.from_snipmate').load({ paths = {"./snippets"} })
        end,
    },
}

return M
