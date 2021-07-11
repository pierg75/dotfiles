vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
    
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- Color scheme
  use {'joshdick/onedark.vim'}


  -- Fuzzy finder
  use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- LSP and completion
  use {'neovim/nvim-lspconfig'}

  -- Lua development
  use {'tjdevries/nlua.nvim'}
  use {'euclidianAce/BetterLua.vim'}


  -- Vim dispatch
  use {'tpope/vim-dispatch'}

  -- Fugitive for Git
  use {'tpope/vim-fugitive'}

end)

