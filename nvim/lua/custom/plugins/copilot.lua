return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    build = ':Copilot auth',
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      copilot_node_command = vim.fn.expand '$HOME' .. '/.nvm/versions/node/v20.10.0/bin/node', -- Node.js version must be > 20.x
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
}
