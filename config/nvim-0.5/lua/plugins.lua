-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Displays a popup with possible key bindings of the command you started typing
  use {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
  }
 
  -- Gitsigns
  use {
  'lewis6991/gitsigns.nvim',
  requires = {
    'nvim-lua/plenary.nvim'
    }
  }

  -- Treesitter
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function()
          require('nvim-treesitter.configs').setup {
              ensure_installed = "maintained",

              highlight = {
                  enable = true,       -- false will disable the whole
                                       -- extension
              },

              rainbow = {
                enable = true,
                extended_mode = true,  -- Highlight also non-parentheses
                                       -- delimiters, boolean or table:
                                       -- lang -> boolean
                max_file_lines = 2000, -- Do not enable for files with
                                       --more than 1000 lines, int
              }
          }
      end
  }

  -- Rainbow parentesis
  use {
	'p00f/nvim-ts-rainbow',
	config = function()
	require'nvim-treesitter.configs'.setup {
	  rainbow = {
    		enable = true,
    		extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    		max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
  	  }
	}	
	end
  }
end)
