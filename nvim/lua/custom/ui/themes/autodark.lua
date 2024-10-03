return {
  'f-person/auto-dark-mode.nvim',
  opts = {
    update_interval = 1000,

    -- base16
    -- eldritch
    -- everforest
    -- gruvbox
    -- kanagawa
    -- rose-pine
    -- synthwave
    -- tokyo-night
    -- vague

    set_dark_mode = function()
      vim.api.nvim_set_option('background', 'dark')
      vim.cmd.colorscheme 'everforest'
    end,

    set_light_mode = function()
      vim.api.nvim_set_option('background', 'light')
      vim.cmd.colorscheme 'everforest'
    end,
  },
}
