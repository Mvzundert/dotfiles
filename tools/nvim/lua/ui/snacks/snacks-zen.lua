return {
  'folke/snacks.nvim',
  keys = {
    {
      '<leader>uz',
      function()
        Snacks.toggle.zen()
      end,
      desc = 'Toggle Zen Mode',
    },
  },
  opts = {
    zen = { enabled = true },
  },
}
