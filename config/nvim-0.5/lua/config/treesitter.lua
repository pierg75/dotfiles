require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", or a list of languages
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
  refactor = {
    highlight_definitions = { enable = true },
  },
  rainbow = {
    enable = false,
    extended_mode = false,   -- Highlight also non-parentheses
                            -- delimiters, boolean or table:
                            -- lang -> boolean
    max_file_lines = 2000,  -- Do not enable for files with
                            --more than 1000 lines, int
  },
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim 
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",

        -- Or you can define your own textobjects like this
        ["iF"] = {
          python = "(function_definition) @function",
          cpp = "(function_definition) @function",
          c = "(function_definition) @function",
          java = "(method_declaration) @function",
        },
      },
    },
  },
}
