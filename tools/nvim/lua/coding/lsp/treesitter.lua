vim.cmd.packadd('nvim-treesitter')

local ok, _ = pcall(function()
  require('nvim-treesitter.config').setup({
    highlight = { enable = true },
    indent = { enable = true },
  })
end)

if not ok then
  vim.notify('nvim-treesitter not yet installed. Restart after vim.pack.add() downloads it.', vim.log.levels.WARN)
end
