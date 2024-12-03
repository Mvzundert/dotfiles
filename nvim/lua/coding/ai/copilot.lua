return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    lazy = true,
    build = ':Copilot auth',
    event = 'InsertEnter',
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      -- @ToDo: add $HOME/.local/share/fnm when on linux check
      copilot_node_command = vim.fn.expand '$HOME' .. '/Library/ApplicationSupport/fnm/node-versions/v20.18.0/installation/bin/Node', -- Node.js version must be > 20.x
      filetypes = {
        markdown = true,
        help = true,
      },
      server_opts_overrides = {
        trace = 'verbose',
        settings = {
          advanced = {
            inlineSuggestCount = 3, -- #completions for getCompletions
          },
        },
      },
    },
  },
}
