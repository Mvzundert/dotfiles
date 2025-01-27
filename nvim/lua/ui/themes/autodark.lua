return {
  'f-person/auto-dark-mode.nvim',
  opts = {
    update_interval = 1000,

    -- vague
    -- catppuccin

    set_dark_mode = function()
      vim.api.nvim_set_option('background', 'dark')
      vim.cmd.colorscheme 'gruvbox'
    end,

    set_light_mode = function()
      vim.api.nvim_set_option('background', 'light')
      vim.cmd.colorscheme 'gruvbox'
    end,
  },
}
