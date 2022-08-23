local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end


local cmp = require 'cmp'
local lspkind = require('lspkind')
cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  window = {
    completion = {
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
      col_offset = -3,
      side_padding = 0,
    },
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = lspkind.cmp_format({
      mode = 'symbol_text', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function (entry, vim_item)
        -- set a name for each source
        vim_item.menu = ({
          buffer = "[Buffer]",
          nvim_lsp = "[nvLSP]",
          vim_lsp = "[vLSP]",
          nvim_lua = "[Lua]",
          look = "[Look]",
          path = "[Path]",
          spell = "[Spell]",
          calc = "[Calc]",
          emoji = "[Emoji]",
          tags = "[Tags]",
          dictionary = "[Dic]"
        })[entry.source.name]
        return vim_item
      end
    })
  },
  mapping = {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    })
  },
  sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = 'vim_lsp' },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "nvim_lua" },
      { name = 'tags' },
      { name = 'nvim_lsp_document_symbol' },
      { name = 'nvim_lsp_signature_help' },
      {
				name = "dictionary",
				keyword_length = 2,
			},
    }, {
      { name = 'buffer' },
  })
})

require("cmp_dictionary").setup({
		dic = {
			["*"] = { "/usr/share/dict/words" },
			filename = {},
			filepath = {},
			spelllang = {},
		},
		-- The following are default values.
		exact = 2,
		first_case_insensitive = false,
		document = false,
		document_command = "wn %s -over",
		async = false, 
		capacity = 5,
		debug = false,
	})
