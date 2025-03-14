return {
  'folke/snacks.nvim',
  ---@type snacks.Config
  opts = {
    toggle = {
      map = vim.keymap.set, -- keymap.set function to use
      which_key = true, -- integrate with which-key to show enabled/disabled icons and colors
      notify = true, -- show a notification when toggling
      -- icons for enabled/disabled states
      icon = {
        enabled = ' ',
        disabled = ' ',
      },
      -- colors for enabled/disabled states
      color = {
        enabled = 'green',
        disabled = 'yellow',
      },
      wk_desc = {
        enabled = 'Disable ',
        disabled = 'Enable ',
      },
    },
  },
}
