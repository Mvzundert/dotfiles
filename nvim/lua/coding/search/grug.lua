local set = vim.keymap.set

return {
  'MagicDuck/grug-far.nvim',
  config = function()
    require('grug-far').setup {
      -- options, see Configuration section below
      -- there are no required options atm
      -- engine = 'ripgrep' is default, but 'astgrep' can be specified
    }
  end,

  set('n', '<leader>gr', '<cmd>:GrugFar<cr>', { desc = 'Search with Grug' }),
}