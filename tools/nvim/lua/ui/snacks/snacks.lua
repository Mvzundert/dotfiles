return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- Compact modules (Enabled directly)
    bigfile = { enabled = true },
    quickfile = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true, timeout = 3000 },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    scope = { enabled = true },
    terminal = { enabled = true },
    zen = { enabled = true },
    image = { enabled = true },
  },
  init = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        -- Debug Globals
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd

        -- Native Toggles
        Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map '<leader>tr'
        Snacks.toggle.line_number():map '<leader>tl'
        Snacks.toggle.treesitter():map '<leader>tT'
        Snacks.toggle.inlay_hints():map '<leader>ti'
        Snacks.toggle.dim():map '<leader>td'
        Snacks.toggle.zen():map '<leader>uz'
        Snacks.toggle.diagnostics():map '<leader>ud'
      end,
    })
  end,
  keys = {
    -- Standard Pickers
    {
      '<leader><space>',
      function()
        Snacks.picker.smart()
      end,
      desc = 'Smart Find Files',
    },
    {
      '<leader>,',
      function()
        Snacks.picker.buffers()
      end,
      desc = 'Buffers',
    },
    {
      '<leader>/',
      function()
        Snacks.picker.grep()
      end,
      desc = 'Grep',
    },
    {
      '<leader>:',
      function()
        Snacks.picker.command_history()
      end,
      desc = 'Command History',
    },
    {
      '<leader>n',
      function()
        Snacks.picker.notifications()
      end,
      desc = 'Notification History',
    },

    -- LSP Pickers
    {
      'gd',
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = 'Goto Definition',
    },
    {
      'gr',
      function()
        Snacks.picker.lsp_references()
      end,
      nowait = true,
      desc = 'References',
    },
    {
      'gi',
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = 'Goto Implementation',
    },

    -- Terminal
    {
      '<leader>tt',
      function()
        Snacks.terminal()
      end,
      desc = 'Toggle Terminal',
    },

    -- Explorer
    {
      '<leader>e',
      function()
        Snacks.explorer()
      end,
      desc = 'File Explorer',
    },
  },
}
