return {
  'eldritch-theme/eldritch.nvim',
  lazy = true,
  priority = 1000,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    transparent = true, -- Enable this to disable setting the background color
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
    styles = {
      -- Style to be applied to different syntax groups
      -- Value is any valid attr-list value for `:help nvim_set_hl`
      comments = { italic = true },
      keywords = { italic = true },
      functions = {},
      variables = {},
      -- Background styles. Can be "dark", "transparent" or "normal"
      sidebars = 'transparent', -- style for sidebars, see below
      floats = 'transparent', -- style for floating windows
    },

    sidebars = { 'qf' }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
    hide_inactive_statusline = true, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
    dim_inactive = true, -- dims inactive windows, transparent must be false for this to work
    lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
  },
}
