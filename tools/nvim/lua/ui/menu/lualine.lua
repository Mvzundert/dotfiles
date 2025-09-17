-- The functions at the top of the file remain unchanged
local function get_branch()
  require('lualine.components.branch.git_branch').init()
  local branch = require('lualine.components.branch.git_branch').get_branch()
  return string.sub(branch, 1, 42)
end

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
        theme = 'auto',
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
            colored = true,
            diff_color = {
              added = 'LuaLineDiffAdd',
              modified = 'LuaLineDiffChange',
              removed = 'LuaLineDiffDelete',
            },
            symbols = { added = '+', modified = '~', removed = '-' },
            source = nil,
          },
          'diagnostics',
        },
        lualine_c = {
          {
            'filename',
            path = 2, -- 1 for relative path, 2 for absolute path.
            -- You can also add other options here, like file_status = true.
          },
          macro_recording,
        },
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
