return {
  'maxmx03/fluoromachine.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    local fm = require 'fluoromachine'

    fm.setup {
      glow = false,
      theme = 'fluoromachine',
      transparent = true,
    }

    vim.cmd.colorscheme 'fluoromachine'
  end,
}
