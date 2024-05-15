return { -- If you want to see what colorschemes are already installed,
  -- you can use `:Telescope colorscheme`.
  -- Default to TokyoNight
  'folke/tokyonight.nvim',
  -- Make sure to load this before all the other start plugins.
  priority = 1000,
  init = function()
    -- Load the colorscheme here.
    -- Like many other themes, this one has different styles, and you could load
    -- any other, such as 'tokyonight-storm', 'tokyonight-moon', 'tokyonight-day', 'kanagawa', 'everforest', 'eldritch 'or 'gruvbox'.
    vim.cmd.colorscheme 'eldritch'

    -- You can configure highlights by doing something like:
    vim.cmd.hi 'Comment gui=none'
  end,
}
