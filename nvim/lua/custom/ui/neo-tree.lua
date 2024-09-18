return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    --    '3rd/image.nvim', -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  opts = {
    auto_clean_after_session_restore = true, -- Automatically clean up broken neo-tree buffers saved in sessions
    close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
    default_source = 'filesystem', -- you can choose a specific source `last` here which indicates the last used source
    enable_diagnostics = false,
    enable_git_status = true,
    add_blank_line_at_top = false, -- Add a blank line at the top of the tree.
    git_status_async_options = {
      batch_size = 1000, -- how many lines of git status results to process at a time
      batch_delay = 10, -- delay in ms between batches. Spreads out the workload to let other processes run.
      max_lines = 10000, -- How many lines of git status results to process. Anything after this will be dropped.
      -- Anything before this will be used. The last items to be processed are the untracked files.
    },
    hide_root_node = true, -- Hide the root node.
    popup_border_style = 'rounded', -- "double", "none", "rounded", "shadow", "single" or "solid"
    filesystem = {
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          -- '.git',
          '.DS_Store',
          'thumbs.db',
        },
        never_show = {},
      },
      follow_current_file = {
        enabled = true, -- This will find and focus the file in the active buffer every time
        --               -- the current file is changed while the tree is open.
        leave_dirs_open = true, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
      },
    },
  },
  keys = {
    {
      '<leader>fe',
      function()
        require('neo-tree.command').execute { toggle = true }
      end,
      desc = 'Explorer NeoTree (Root Dir)',
    },
    {
      '<leader>fE',
      function()
        require('neo-tree.command').execute { toggle = true, dir = vim.uv.cwd() }
      end,
      desc = 'Explorer NeoTree (cwd)',
    },
    { '<leader>e', '<leader>fe', desc = 'Explorer NeoTree (Root Dir)', remap = true },
    { '<leader>E', '<leader>fE', desc = 'Explorer NeoTree (cwd)', remap = true },
  },
  deactivate = function()
    vim.cmd [[Neotree close]]
  end,
  init = function()
    if vim.fn.argc(-1) == 1 then
      local stat = vim.uv.fs_stat(vim.fn.argv(0))
      if stat and stat.type == 'directory' then
        require 'neo-tree'
      end
    end
  end,
}
