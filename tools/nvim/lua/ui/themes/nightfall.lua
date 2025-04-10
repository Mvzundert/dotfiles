return {
  '2giosangmitom/nightfall.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    transparent = true,
    transparent_sidebar = true,
    transparent_statusline = true,
    transparent_float = true,
    dim_inactive = false,
    dim_inactive_filetypes = { 'Outline', 'Trouble' },
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      functions = { italic = true },
      variables = { italic = false },
    },
  }, -- Add custom configuration here
  config = function(_, opts)
    require('nightfall').setup(opts)
    vim.cmd 'colorscheme deeper-night' -- Choose from: nightfall, deeper-night, maron, nord
  end,
}
