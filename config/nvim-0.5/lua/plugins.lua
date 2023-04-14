vim.cmd [[packadd packer.nvim]]

-- Packer bootstrap
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
local packer = require('packer')


-- Packer floating
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
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
      requires = {
	{'nvim-lua/popup.nvim'},
	{'nvim-lua/plenary.nvim'},
        { "nvim-telescope/telescope-live-grep-args.nvim" }
      },
      config = function()
          require("telescope").load_extension("live_grep_args")
      end
  }

  -- LSP and completion
  use {
    'neovim/nvim-lspconfig',

  }

  use { 
    'j-hui/fidget.nvim', 
    opts = {} 
  }

  use {
      'folke/neodev.nvim',
  }

  -- This tiny plugin adds vscode-like pictograms to neovim built-in lsp
  use({
      "onsails/lspkind-nvim",
      config = function()
        require("lspkind").init({})
      end,
  })

  -- Server installer
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  }

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
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "uga-rosa/cmp-dictionary",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "prabirshrestha/vim-lsp",
      "dmitmel/cmp-vim-lsp",
      "quangnguyen30192/cmp-nvim-tags",
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
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}

  -- terminal
  use "akinsho/toggleterm.nvim"

  -- Bufferline
  use {'akinsho/nvim-bufferline.lua'}

  -- indents
  use {
      'lukas-reineke/indent-blankline.nvim',
      config = function()
        require("indent_blankline").setup({
          show_current_context = true,
          show_current_context_start = true,
        })
      end,
  }


  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

-- Diagnostics plugin for neo-tree
  use {
    "mrbjarksen/neo-tree-diagnostics.nvim",
    requires = "nvim-neo-tree/neo-tree.nvim",
}

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
    after = { "nvim-cmp" }
  })


  -- Trouble
  use {
    "folke/trouble.nvim",
      requires = "nvim-tree/nvim-web-devicons",
      config = function()
       end
  }

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

  -- Shows where the cursor is
  use({"edluffy/specs.nvim"})

  use({
    "iamcco/markdown-preview.nvim",
    run = ":call mkdp#util#install()",
    ft = "markdown",
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

  -- Speed up!
  use {"lewis6991/impatient.nvim"}

  -- Nice C extension
  use {"p00f/clangd_extensions.nvim"}


  -- Yaml schema hanlding
  use {
  "someone-stole-my-name/yaml-companion.nvim",
    requires = {
      { "neovim/nvim-lspconfig" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require("telescope").load_extension("yaml_schema")
      end,
    }

  -- skim plugin (fzf-lua supports skim)
  use { 'ibhagwan/fzf-lua',
    -- optional for icon support
    requires = { 'nvim-tree/nvim-web-devicons' }
  }

  use { 'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  use { 'dnlhc/glance.nvim',
    config = function()
      require('glance').setup({
        -- your configuration
      })
    end,
  }

  use {'nvim-orgmode/orgmode', config = function()
    require('orgmode').setup{}
  end
}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

