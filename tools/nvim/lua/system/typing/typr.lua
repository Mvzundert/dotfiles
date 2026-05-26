vim.api.nvim_create_user_command('Typr', function()
  vim.pack.add({ { src = 'https://github.com/nvzone/volt', name = 'volt' } }, { confirm = false })
  vim.pack.add({ { src = 'https://github.com/nvzone/typr', name = 'typr' } }, { confirm = false })
  vim.cmd 'runtime! plugin/typr.lua'
  vim.cmd 'Typr'
end, {})

vim.api.nvim_create_user_command('TyprStats', function()
  vim.pack.add({ { src = 'https://github.com/nvzone/volt', name = 'volt' } }, { confirm = false })
  vim.pack.add({ { src = 'https://github.com/nvzone/typr', name = 'typr' } }, { confirm = false })
  vim.cmd 'runtime! plugin/typr.lua'
  vim.cmd 'TyprStats'
end, {})
