vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.shell = 'fish'
vim.o.shellcmdflag = '-lc'

vim.env.XDG_CACHE_HOME = '/tmp/phpactor-cache-' .. tostring(vim.fn.getpid())

vim.pack.add({
  { src = 'https://github.com/saghen/blink.cmp', name = 'blink.cmp' },
  { src = 'https://github.com/rafamadriz/friendly-snippets', name = 'friendly-snippets' },
  { src = 'https://github.com/stevearc/conform.nvim', name = 'conform.nvim' },
  { src = 'https://github.com/laytan/cloak.nvim', name = 'cloak.nvim' },
  { src = 'https://github.com/OXY2DEV/markview.nvim', name = 'markview.nvim' },
  { src = 'https://github.com/lewis6991/gitsigns.nvim', name = 'gitsigns.nvim' },
  { src = 'https://github.com/williamboman/mason.nvim', name = 'mason.nvim' },
  { src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim', name = 'mason-tool-installer.nvim' },
  { src = 'https://github.com/echasnovski/mini.nvim', name = 'mini.nvim' },
  { src = 'https://github.com/echasnovski/mini.bufremove', name = 'mini.bufremove' },
  { src = 'https://github.com/nvzone/typr', name = 'typr' },
  { src = 'https://github.com/nvzone/volt', name = 'volt' },
  { src = 'https://github.com/stevearc/oil.nvim', name = 'oil.nvim' },
  { src = 'https://github.com/akinsho/bufferline.nvim', name = 'bufferline.nvim' },
  { src = 'https://github.com/folke/noice.nvim', name = 'noice.nvim' },
  { src = 'https://github.com/MunifTanjim/nui.nvim', name = 'nui.nvim' },
  { src = 'https://github.com/folke/which-key.nvim', name = 'which-key.nvim' },
  { src = 'https://github.com/folke/snacks.nvim', name = 'snacks.nvim' },
  { src = 'https://github.com/folke/trouble.nvim', name = 'trouble.nvim' },
  { src = 'https://github.com/nvim-lua/plenary.nvim', name = 'plenary.nvim' },
  { src = 'https://github.com/folke/todo-comments.nvim', name = 'todo-comments.nvim' },
  { src = 'https://github.com/folke/tokyonight.nvim', name = 'tokyonight.nvim' },
  { src = 'https://github.com/kevinhwang91/nvim-hlslens', name = 'nvim-hlslens' },
  { src = 'https://github.com/tjdevries/present.nvim', name = 'present.nvim' },
}, { confirm = false })
