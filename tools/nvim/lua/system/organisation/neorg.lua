return {
  'nvim-neorg/neorg',
  lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  version = '*', -- Pin Neorg to the latest stable release
  config = function()
    require('neorg').setup {
      load = {
        ['core.defaults'] = {},
        ['core.concealer'] = {},
        ['core.summary'] = {},
        -- ['core.presenter'] = {},
        ['core.ui.calendar'] = {},
        -- We use our own keybinds
        ['core.keybinds'] = {
          config = {
            default_keybinds = false,
          },
        },
        -- we set the directories we use for workspaces
        ['core.dirman'] = {
          config = {
            workspaces = {
              notes = '~/documents/notes',
            },
            default_workspace = 'notes',
          },
        },
      },
    }
    vim.wo.foldlevel = 99
    vim.wo.conceallevel = 2
  end,
}
