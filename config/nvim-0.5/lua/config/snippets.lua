local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
	return
end

-- You can also use lazy loading so you only get in memory snippets of languages you use
require("luasnip/loaders/from_vscode").lazy_load() -- You can pass { path = "./my-snippets/"} as well)
