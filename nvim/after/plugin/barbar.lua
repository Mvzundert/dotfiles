-- Move to previous/next
vim.keymap.set("n", "<leader>tn", '<Cmd>BufferPrevious<CR>', opts)
vim.keymap.set("n", "<leader>tp", '<Cmd>BufferNext<CR>',  opts)

-- Close buffer
vim.keymap.set("n", "<leader>tw", '<Cmd>BufferClose<CR>',  opts)
