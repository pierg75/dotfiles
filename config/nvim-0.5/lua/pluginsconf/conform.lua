local m = {
  "stevearc/conform.nvim",
}

function m.config()
  require("conform").setup({
    formatters_by_ft = {
      python = { "ruff_fix", "ruff_format", "black" },
      ["*"] = { "trim_whitespace", "trim_newlines" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  })
end

return m
