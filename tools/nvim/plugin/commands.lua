-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
local cmd = vim.cmd
local api = vim.api
local diagnostic = vim.diagnostic
local set = vim.keymap.set

-- If you want to see what colorschemes are already installed,
-- you can use ``.
--
-- Load the colorscheme here, when Autodark is not active
-- Like many other themes, this one has different styles, and you could load
-- any other, such as
-- 'rose-pine',
-- 'everforest',
cmd.colorscheme 'everforest'

cmd.hi 'Comment gui=none'

cmd [[
  hi Normal      guibg=NONE ctermbg=NONE
  hi NormalNC    guibg=NONE ctermbg=NONE
  hi TermNormal  guibg=NONE ctermbg=NONE
  hi TermNormalNC guibg=NONE ctermbg=NONE
]]

-- Configure diagnostics
diagnostic.config {
  float = {
    focusable = false,
    style = 'minimal',
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
}

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

-- Create keymappings only when in norg files to prevent conflicts
api.nvim_create_autocmd('Filetype', {
  pattern = 'norg',
  callback = function()
    -- Normal mode mappings
    set('n', '<leader>nn', '<Plug>(neorg.dirman.new-note)', { buffer = true }, { desc = '[O]rganise [N]ew note' })
    set('n', '<leader><CR>', '<Plug>(neorg.qol.todo-items.todo.task-cycle)', { desc = '[O]rganisation Task [T]oggle' })
    set('n', '<CR>', '<Plug>(neorg.esupports.hop.hop-link)', { desc = '[O]rganisation [F]ollow Link' })
    set('n', '<leader>li', '<Plug>(neorg.pivot.list.invert)', { desc = '[L]ist [I]nvert' })
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
