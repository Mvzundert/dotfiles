return {
  'AlexvZyl/nordic.nvim',
  priority = 1000,
  lazy = true,
  opts = {
    -- Enable bold keywords.
    bold_keywords = false,
    -- Enable italic comments.
    italic_comments = true,
    -- Enable general editor background transparency.
    transparent_bg = true,
    -- Enable brighter float border.
    bright_border = true,
    -- Reduce the overall amount of blue in the theme (diverges from base Nord).
    reduced_blue = true,
    -- Swap the dark background with the normal one.
    swap_backgrounds = false,
    -- Override the styling of any highlight group.
    override = {},
    -- Cursorline options.  Also includes visual/selection.
    cursorline = {
      -- Bold font in cursorline.
      bold = false,
      -- Bold cursorline number.
      bold_number = true,
      -- Available styles: 'dark', 'light'.
      theme = 'dark',
      -- Blending the cursorline bg with the buffer bg.
      blend = 0.85,
    },
    telescope = {
      -- Available styles: `classic`, `flat`.
      style = 'flat',
    },
  },
}
