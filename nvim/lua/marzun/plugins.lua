-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use('nvim-lua/plenary.nvim')

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		-- or                            , branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	use {
		"startup-nvim/startup.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require "startup".setup(require "config.startup_nvim")
		end
	}

	use({
		"catppuccin/nvim", as = "catppuccin"
	})

	use {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		}
	}

	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
	use('theprimeagen/harpoon')
	use('mbbill/undotree')
	use('mfussenegger/nvim-lint')

	-- Fidget information in the statusline
	use {
		'j-hui/fidget.nvim',
		tag = 'legacy',
		config = function()
			require("fidget").setup {
				-- options
			}
		end,
	}

	use('nvim-lualine/lualine.nvim')        -- Fancier statusline
	use('lukas-reineke/indent-blankline.nvim') -- Add indentation guides even on blank lines
	use('tpope/vim-sleuth')                 -- Detect tabstop and shiftwidth automatically
	use('jxnblk/vim-mdx-js')                -- Make vim understand MDX files.

	-- Tabline
	use 'romgrk/barbar.nvim'


	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}

	-- WhichKey
	use {
		"folke/which-key.nvim",
		config = function()
			require("config.whichkey").setup()
		end,
	}

	use {
		'folke/todo-comments.nvim',
		requires = 'nvim-lua/plenary.nvim', -- required by todo-comments
		config = function()
			require('todo-comments').setup()
		end
	}

	-- Git stuff
	use('lewis6991/gitsigns.nvim')
	use('tpope/vim-rhubarb')
	use 'nvim-tree/nvim-web-devicons'

	-- Git Copilot
	use('github/copilot.vim') -- Make Github Copilot be a thing

	-- Setup Fugitive and it's dependencies
	use('tpope/vim-fugitive')
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },
			{ 'rafamadriz/friendly-snippets' },
		}
	}
end)
