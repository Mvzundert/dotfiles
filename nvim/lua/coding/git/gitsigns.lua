return { -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  lazy = false,
  opts = {
    current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
    signs = {
      add = { text = '┃' },
      change = { text = ' ' },
      delete = { text = ' ' },
      topdelete = { text = '‾' },
      changedelete = { text = ' ' },
      untracked = { text = '┆' },
    },
    signs_staged = {
      add = { text = '┃' },
      change = { text = '┃' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
      untracked = { text = '┆' },
    },
  },
  keys = {
    {
      '<leader>gsb',
      function()
        require('gitsigns').toggle_current_line_blame()
      end,
      mode = '',
      desc = 'Toggle git line blame',
    },
    {
      '<leader>gsd',
      function()
        require('gitsigns').toggle_deleted()
      end,
      mode = '',
      desc = 'Toggle git deleted',
    },
  },
}
