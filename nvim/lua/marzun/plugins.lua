-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use({
        'dracula/vim', as = 'dracula',
    })

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('mfussenegger/nvim-lint')
    use('j-hui/fidget.nvim')

    use('nvim-lualine/lualine.nvim') -- Fancier statusline
    use('lukas-reineke/indent-blankline.nvim') -- Add indentation guides even on blank lines
    use('numToStr/Comment.nvim') -- "gc" to comment visual regions/lines
    use('tpope/vim-sleuth') -- Detect tabstop and shiftwidth automatically

    -- Git stuff
    use('lewis6991/gitsigns.nvim')
    use('tpope/vim-rhubarb')

    -- Setup Fugitive and it's dependencies
    use('tpope/vim-fugitive')
      use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }
end)
