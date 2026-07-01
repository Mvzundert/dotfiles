-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
local cmd = vim.cmd
local api = vim.api
local diagnostic = vim.diagnostic

dofile(vim.fn.stdpath('config') .. '/current-theme.lua')

cmd.hi 'Comment gui=none'

cmd [[
  hi Normal      guibg=NONE ctermbg=NONE
  hi NormalNC    guibg=NONE ctermbg=NONE
  hi TermNormal  guibg=NONE ctermbg=NONE
  hi TermNormalNC guibg=NONE ctermbg=NONE
]]

-- Configure diagnostics
diagnostic.config {
  severity_sort = true,
  float = {
    focusable = false,
    style = 'minimal',
    border = 'rounded',
    source = 'if_many',
    header = '',
    prefix = '',
  },
  virtual_text = true,
  jump = {
    on_jump = function(_, bufnr)
      diagnostic.open_float { bufnr = bufnr, scope = 'cursor', focus = false }
    end,
  },
}

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

api.nvim_create_autocmd('FileType', {
  pattern = { 'elixir', 'eex', 'heex', 'erlang' },
  callback = function()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
    vim.bo.softtabstop = 2
  end,
})

-- Auto-show diagnostics on hover
api.nvim_create_autocmd('CursorHold', {
  callback = function()
    local opts = {
      focusable = false,
      close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
      border = 'rounded',
      source = 'always',
      prefix = ' ',
      scope = 'cursor',
    }
    diagnostic.open_float(nil, opts)
  end,
})
