local set = vim.keymap.set

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
set('n', '<leader>em', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- save file
set({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })

-- better indenting
set('v', '<', '<gv')
set('v', '>', '>gv')

-- Preview colorschemes
set('n', '<leader>tcs', '<cmd>Telescope colorscheme<cr>', { desc = 'Switch Colorscheme' })

-- quit
set('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit All' })

-- ==============
-- Snacks Keymaps
-- ==============

-- Snacks.explorer.open(opts)

-- Snacks Explorer
set('n', '<leader>e', function()
  Snacks.explorer.open(opts)
end, { desc = 'Filetree' })

-- Snacks grep search
set('n', '<leader>/', function()
  Snacks.picker.grep()
end, { desc = 'Grep' })

-- Snacks Command History
set('n', '<leader>:', function()
  Snacks.picker.command_history()
end, { desc = 'Command History' })

-- Snacks Command History
set('n', '<leader>fc', function()
  Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
end, { desc = 'Find Config Files' })

-- Snacks Find Git files
set('n', '<leader>fg', function()
  Snacks.picker.git_files()
end, { desc = 'Find Git Files' })

-- Snacks Find Git files
set('n', '<leader>fg', function()
  Snacks.picker.git_files()
end, { desc = 'Find Git Files' })

-- Snacks Autocmds
set('n', '<leader>sa', function()
  Snacks.picker.autocmds()
end, { desc = 'Autocmds' })

-- Snacks Commands
set('n', '<leader>sC', function()
  Snacks.picker.commands()
end, { desc = 'Commands' })

-- Snacks Command History
set('n', '<leader>sc', function()
  Snacks.picker.command_history()
end, { desc = 'Command History' })

-- Snacks Diagnostics
set('n', '<leader>sd', function()
  Snacks.picker.diagnostics()
end, { desc = 'Diagnostics' })

-- Snacks Diagnostics
set('n', '<leader>sd', function()
  Snacks.picker.diagnostics()
end, { desc = 'Diagnostics' })

-- Snacks Buffer Diagnostics
set('n', '<leader>sD', function()
  Snacks.picker.diagnostics_buffer()
end, { desc = 'Buffer Diagnostics' })

-- Snacks Help pages
set('n', '<leader>sh', function()
  Snacks.picker.help()
end, { desc = 'Help Pages' })

-- Snacks search keymaps
set('n', '<leader>sk', function()
  Snacks.picker.keymaps()
end, { desc = 'Search Keymaps' })

-- Snacks Resume
set('n', '<leader>sR', function()
  Snacks.picker.resume()
end, { desc = 'Resume' })

-- Snacks View undo history
set('n', '<leader>su', function()
  Snacks.picker.undo()
end, { desc = 'View Undo History' })

-- Snacks Zen mode
set('n', '<leader>z', function()
  Snacks.zen()
end, { desc = 'Toggle Zen Mode' })
