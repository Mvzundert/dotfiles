return {
      "folke/tokyonight.nvim",
  lazy = true,
  opts = {
        style = "night",
        transparent = true,
        light_style = "day", -- The theme is used when the background is set to light
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
        styles = {
            -- Style to be applied to different syntax groups
            -- Value is any valid attr-list value for `:help nvim_set_hl`
            comments = { italic = true },
            keywords = { italic = true },
            functions = {},
            variables = {},
            -- Background styles. Can be "dark", "transparent" or "normal"
            sidebars = "transparent", -- style for sidebars, see below
            floats = "transparent", -- style for floating windows
        },
      },
}
