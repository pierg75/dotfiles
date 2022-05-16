vim.cmd [[packadd packer.nvim]]

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

local packer = require('packer')

-- Packer floating
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}
    
return packer.startup(function()
    
  -- Packer can manage itself as an optional plugin
  use {
        'wbthomason/packer.nvim', 
        opt = true
  }

  -- Color scheme
  use {
        'joshdick/onedark.vim',
        branch = 'main'
  }

  -- Fuzzy finder
  use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- LSP and completion
  use {'neovim/nvim-lspconfig'}
  -- This tiny plugin adds vscode-like pictograms to neovim built-in lsp
  use({
      "onsails/lspkind-nvim",
      config = function()
        require("lspkind").init({})
      end,
  })

  -- Install nvim-cmp, and buffer source as a dependency
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "octaltree/cmp-look", 
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-calc",
      "f3fora/cmp-spell",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
    }
  }

  -- Rust tools
  use {'mfussenegger/nvim-dap'}
  use {'simrat39/rust-tools.nvim'}
  use {'nvim-lua/lsp_extensions.nvim'}
  use {'ray-x/lsp_signature.nvim'}

  -- Highlights
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-treesitter-textobjects',
    }
  }

  -- Lua development
  use {'tjdevries/nlua.nvim'}
  use {'euclidianAce/BetterLua.vim'}

  -- Gitplugins
  use {'tpope/vim-fugitive'}
  use({
      "lewis6991/gitsigns.nvim",
      requires = "nvim-lua/plenary.nvim",
  })

  -- Statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}

  -- terminal
  use "akinsho/toggleterm.nvim"

  -- Bufferline
  use {'akinsho/nvim-bufferline.lua'}

  -- indents
  use {
      'lukas-reineke/indent-blankline.nvim',
      config = function()
        vim.opt.colorcolumn = "80" -- highlight bug hack fix
        require("indent_blankline").setup({
          buftype_exclude = { "help", "terminal" },
          filetype_exclude = { "text", "markdown" },
          show_current_context = true,
          show_first_indent_level = true,
          show_trailing_blankline_indent = false,
        })
      end,
  }

  -- Tree
  use {'kyazdani42/nvim-tree.lua'}

  -- Snippets
  use {'cstrap/python-snippets'}
  use {'ylcnfrht/vscode-python-snippet-pack'}
  use {'rust-lang/vscode-rust'}
  use {'rafamadriz/friendly-snippets'}

  -- Rainbow parens
  use 'p00f/nvim-ts-rainbow'
  -- Auto close brackets etc (with treesitter support)
  use({
    "windwp/nvim-autopairs",
    after = { "nvim-cmp" },
    config = function()
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
    end,
  })

  -- Trouble
  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    event = "BufReadPre",
    cmd = { "TroubleToggle", "Trouble" },
    config = function()
      require("trouble").setup({
        auto_open = false
      })
    end,
  })

  -- Focus on what you do
  use {
      'folke/twilight.nvim',
      config = function()
      require('twilight').setup {}
  end
  }

  -- Comment'em all
  use 'winston0410/commented.nvim'

  -- Playing with zettel 
  use "oberblastmeister/neuron.nvim"

  -- clip manager
  use {
    "AckslD/nvim-neoclip.lua",
    config = function()
        require('neoclip').setup()
    end,
  }

  -- Ack provider
  use { "wincent/ferret" }

  -- Shows where the cursor is
  use({"edluffy/specs.nvim"})

  use({
    "iamcco/markdown-preview.nvim",
    run = ":call mkdp#util#install()",
    ft = "markdown",
  })

  use({
    "andymass/vim-matchup",
    config = function()
      vim.g.matchup_matchparen_offscreen = {}
    end,
  })

  -- Nice drawings
  use({"vim-scripts/DrawIt"})

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

