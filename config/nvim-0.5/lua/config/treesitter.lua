require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "javascript"}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,   -- Highlight also non-parentheses
                            -- delimiters, boolean or table:
                            -- lang -> boolean
    max_file_lines = 2000,  -- Do not enable for files with
                            --more than 1000 lines, int
  },
}
