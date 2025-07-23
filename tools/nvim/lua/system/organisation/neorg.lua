return {
  'nvim-neorg/neorg',
  lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  version = '*', -- Pin Neorg to the latest stable release
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- Required for syntax highlighting and folding
  },
  config = function()
    require('neorg').setup {
      load = {
        ['core.defaults'] = {},
        ['core.concealer'] = {},
        ['core.summary'] = {},
        ['core.export'] = {},
        ['core.integrations.treesitter'] = {},
        ['core.integrations.nvim-cmp'] = {},

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
              notes = '~/documents/notes/neorg/',
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
