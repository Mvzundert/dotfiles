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
      -- Add $HOME/.local/share/fnm when on linux check
      copilot_node_command = (function()
        local os_name = vim.loop.os_uname().sysname
        if os_name == 'Darwin' then
          -- macOS
          return vim.fn.expand '$HOME' .. '/Library/ApplicationSupport/fnm/node-versions/v20.18.0/installation/bin/Node'
        elseif os_name == 'Linux' then
          -- Linux
          return vim.fn.expand '$HOME' .. '/.fnm/node-versions/v22.14.0/installation/bin/node'
        else
          -- Default or unsupported OS
          return 'node' -- Fallback to just 'node' command
        end
      end)(),
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
