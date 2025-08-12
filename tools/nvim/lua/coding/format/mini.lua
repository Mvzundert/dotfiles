return {
  'echasnovski/mini.nvim',
  config = function()
    -- Highlight the current word under the cursor
    require('mini.cursorword').setup()

    -- Show the indent lines
    require('mini.indentscope').setup()

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()

    -- Better Around/Inside textobjects
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Move code around
    require('mini.move').setup {
      mappings = {
        -- Move visual selection in Visual mode using Option + Arrow keys
        left = '<A-Left>',
        right = '<A-Right>',
        down = '<A-Down>',
        up = '<A-Up>',
      },

      -- Options which control moving behavior
      options = {
        -- Automatically reindent selection during linewise vertical move
        reindent_linewise = true,
      },
    }
  end,
}
