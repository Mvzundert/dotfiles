return {
  'm4xshen/hardtime.nvim',
  lazy = false,
  dependencies = { 'MunifTanjim/nui.nvim' },
  opts = {
    -- We set Hardtime to off by default and we toggle it on when we want to give ourself a hardtime.
    enabled = false,
    notification = true,
    restriction_mode = 'hint',
  },
}
