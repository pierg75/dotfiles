vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
    
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
  use {'hrsh7th/nvim-compe'}
  use {'glepnir/lspsaga.nvim'}
  use {'simrat39/rust-tools.nvim'}
  use {'nvim-lua/lsp_extensions.nvim'}
  use {'ray-x/lsp_signature.nvim'}

  -- Highlights
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    run = ':TSUpdate',
  }

  -- Lua development
  use {'tjdevries/nlua.nvim'}
  use {'euclidianAce/BetterLua.vim'}

  -- Fugitive for Git
  use {'tpope/vim-fugitive'}

  -- Statusline
  use {
      'famiu/feline.nvim',
      requires = {{'kyazdani42/nvim-web-devicons'}, {'lewis6991/gitsigns.nvim'}}
  }

  -- Bufferline
  use {'akinsho/nvim-bufferline.lua'}

  -- indents
  use {'lukas-reineke/indent-blankline.nvim'}

  -- Tree
  use {'kyazdani42/nvim-tree.lua'}

  -- Snippets
  use {'hrsh7th/vim-vsnip'}
  use {'cstrap/python-snippets'}
  use {'ylcnfrht/vscode-python-snippet-pack'}
  use {'rust-lang/vscode-rust'}

  -- Rainbow parens
  use 'p00f/nvim-ts-rainbow'

  -- Trouble
  use {
      'folke/trouble.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function() require("trouble").setup {} end
  }
end)

