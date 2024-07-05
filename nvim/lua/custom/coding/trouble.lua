return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    { '<leader>t', '', desc = '+[T]rouble' },
    { '<leader>to', '<cmd>TroubleToggle<cr>', desc = 'Open Trouble' },
    { '<leader>tr', '<cmd>TroubleRefresh<cr>', desc = 'Refresh Trouble' },
  },
}
