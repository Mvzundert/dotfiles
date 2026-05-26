require('bufferline').setup {
  options = {
    separator_style = 'thin',
    close_command = function(n) require('mini.bufremove').delete(n, false) end,
    right_mouse_command = function(n) require('mini.bufremove').delete(n, false) end,
    diagnostics = 'nvim_lsp',
    always_show_bufferline = false,
  },
}

vim.api.nvim_create_autocmd('BufAdd', {
  callback = function()
    vim.schedule(function()
      pcall(nvim_bufferline)
    end)
  end,
})
