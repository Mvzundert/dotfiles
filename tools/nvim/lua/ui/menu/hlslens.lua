require('hlslens').setup()

vim.keymap.set('n', 'n', [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
  { desc = 'Next Match' })
vim.keymap.set('n', 'N', [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
  { desc = 'Prev Match' })
vim.keymap.set('n', '*', [[<Cmd>execute('normal! ' . v:count1 . '*')<CR><Cmd>lua require('hlslens').start()<CR>]],
  { desc = 'Word Next' })
vim.keymap.set('n', '#', [[<Cmd>execute('normal! ' . v:count1 . '#')<CR><Cmd>lua require('hlslens').start()<CR>]],
  { desc = 'Word Prev' })
vim.keymap.set('n', 'g*', [[<Cmd>execute('normal! ' . v:count1 . 'g*')<CR><Cmd>lua require('hlslens').start()<CR>]],
  { desc = 'Word Next (partial)' })
vim.keymap.set('n', 'g#', [[<Cmd>execute('normal! ' . v:count1 . 'g#')<CR><Cmd>lua require('hlslens').start()<CR>]],
  { desc = 'Word Prev (partial)' })
