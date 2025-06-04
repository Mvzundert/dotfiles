return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  init = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map '<leader>tr'
        Snacks.toggle.line_number():map '<leader>tl'
        Snacks.toggle.treesitter():map '<leader>tT'
        Snacks.toggle.inlay_hints():map '<leader>th'

        -- Dimming
        Snacks.toggle.dim():map '<leader>td'
      end,
    })
  end,
}
