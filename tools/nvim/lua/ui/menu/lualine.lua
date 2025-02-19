-- Added git branch information to the statusline
local function get_branch()
  require('lualine.components.branch.git_branch').init()
  local branch = require('lualine.components.branch.git_branch').get_branch()
  return string.sub(branch, 1, 42)
end

-- Fixed recording not showing in status line
local function macro_recording()
  local mode = require('noice').api.statusline.mode.get()
  if mode then
    return string.match(mode, '^recording @.*') or ''
  end
  return ''
end

return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy',
    opts = {
      options = {
        theme = 'auto', -- auto(detects automatically), gruvbox, everforest, eldritch
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = {
          get_branch,
          {
            'diff',
            colored = true, -- Displays a colored diff status if set to true
            diff_color = {
              -- Same color values as the general color option can be used here.
              added = 'LuaLineDiffAdd', -- Changes the diff's added color
              modified = 'LuaLineDiffChange', -- Changes the diff's modified color
              removed = 'LuaLineDiffDelete', -- Changes the diff's removed color you
            },
            symbols = { added = '+', modified = '~', removed = '-' }, -- Changes the symbols used by the diff.
            source = nil, -- A function that works as a data source for diff.
            -- It must return a table as such:
            --   { added = add_count, modified = modified_count, removed = removed_count }
            -- or nil on failure. count <= 0 won't be displayed.
          },
          'diagnostics',
        },
        lualine_c = { 'filename', macro_recording },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    },
  },
}
