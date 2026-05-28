require('noice').setup {
  lsp = {
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
      ['cmp.entry.get_documentation'] = true,
    },
  },
  routes = {
    {
      filter = {
        event = 'msg_show',
        any = {
          { find = '%d+L, %d+B' },
          { find = '; after #%d+' },
          { find = '; before #%d+' },
        },
      },
      view = 'mini',
    },
  },
  presets = {
    bottom_search = false,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = true,
  },
}

vim.keymap.set({ 'i', 'n', 's' }, '<c-f>', function()
  if not require('noice.lsp').scroll(4) then
    return '<c-f>'
  end
end, { silent = true, expr = true, desc = 'Scroll Forward' })

vim.keymap.set({ 'i', 'n', 's' }, '<c-b>', function()
  if not require('noice.lsp').scroll(-4) then
    return '<c-b>'
  end
end, { silent = true, expr = true, desc = 'Scroll Backward' })

vim.keymap.set('c', '<S-Enter>', function()
  require('noice').redirect(vim.fn.getcmdline())
end, { desc = 'Redirect Cmdline' })

vim.keymap.set('n', '<leader>nl', function()
  require('noice').cmd 'last'
end, { desc = 'Noice Last Message' })

vim.keymap.set('n', '<leader>nh', function()
  require('noice').cmd 'history'
end, { desc = 'Noice History' })

vim.keymap.set('n', '<leader>na', function()
  require('noice').cmd 'all'
end, { desc = 'Noice All' })

vim.keymap.set('n', '<leader>nd', function()
  require('noice').cmd 'dismiss'
end, { desc = 'Dismiss All' })
