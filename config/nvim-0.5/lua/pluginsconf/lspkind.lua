local M = {
	"onsails/lspkind-nvim",
}

function M.config()
  require("lspkind").init({})
end
return M
