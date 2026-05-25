return {
  'folke/snacks.nvim',
  keys = {
    {
      '<leader>tt',
      function()
        Snacks.terminal()
      end,
      desc = 'Toggle Terminal',
    },
  },
  opts = {
    terminal = { enabled = true },
  },
}
