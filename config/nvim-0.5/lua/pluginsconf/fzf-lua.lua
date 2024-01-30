local M = {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- calling `setup` is optional for customization
}

function M.config()
  require("fzf-lua").setup({
    'skim',
    winopts = {
      preview = { default = 'bat_native' }
    },
    grep = {
      rg_opts = "--sort-files --hidden --column --line-number --no-heading " ..
          "--color=always --smart-case -g '!{.git,node_modules}/*'",
      git_icons = false,
      file_icons = false,
    },
    live_grep = {
      git_icons = false,
      file_icons = false,
    },
  })
end

return M
