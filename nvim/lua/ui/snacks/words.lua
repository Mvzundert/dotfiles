return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    words = {
      enabled = true, -- enable/disable the plugin
      debounce = 200, -- time in ms to wait before updating
      notify_jump = false, -- show a notification when jumping
      notify_end = true, -- show a notification when reaching the end
      foldopen = true, -- open folds after jumping
      jumplist = true, -- set jump point before jumping
      modes = { 'n', 'i', 'c' }, -- modes to show references
    },
    styles = {
      notification = {
        wo = { wrap = true }, -- Wrap notifications
      },
    },
  },
}
