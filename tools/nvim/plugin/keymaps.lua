-- =====================================================================
-- For Basic Keymaps See `:help vim.keymap.set()`
-- =====================================================================
-- Alias vim.keymap.set to set for easier to read syntax
local set = vim.keymap.set

-- =====================================================================
-- Groups for keymaps only used for which key formatting
-- =====================================================================
set('n', '<leader>s', '', { desc = '+[S]earch' })
set('n', '<leader>b', '', { desc = '+[B]uffers' })
set('n', '<leader>o', '', { desc = '+[O]rganisation' })
set('n', '<leader>g', '', { desc = '+[G]it and [G]oto Definitions' })
set('n', '<leader>l', '', { desc = '+[L]azy Git' })
set('n', '<leader>f', '', { desc = '+[F]ind' })
set('n', '<leader>p', '', { desc = '+[P]review' })
set('n', '<leader>r', '', { desc = '+[R]ename' })
set('n', '<leader>c', '', { desc = '+[C]ode and [C]heck' })
set('n', '<leader>t', '', { desc = '+[T]oggle' })
set('n', '<leader>m', '', { desc = '+[M]arkdown' })
set('n', '<leader>q', '', { desc = '+[Q]uit' })

-- =====================================================================
-- Find
-- =====================================================================
set('n', '<leader>fc', function()
  Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[F]ind [C]onfig Files' })

-- =====================================================================
-- Preview
-- =====================================================================
set('n', '<leader>pC', function()
  Snacks.picker.colorschemes()
end, { desc = '[P]review [C]olor schemes' })

set('n', '<leader>p?', function()
  require('which-key').show { global = false }
end, { desc = '[P]review Buffer Local Keymaps (which-key)' })

-- =====================================================================
-- Navigation
-- =====================================================================
-- TIP: Disable arrow keys in normal mode
set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Set highlight on search, but clear on pressing <Esc> in normal mode
set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Open oil file picker
set('n', '<leader>-', require('oil').toggle_float, { desc = '[-] Open Oil' })

-- Easier exit terminal mode
set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- quit
set('n', '<leader>qa', '<cmd>qa<cr>', { desc = '[Q]uit [A]ll' })

-- save file
set({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })

-- =====================================================================
-- Formatting
-- =====================================================================
-- better indenting
set('v', '<', '<gv')
set('v', '>', '>gv')

-- =====================================================================
-- Explorer
-- =====================================================================
set('n', '<leader>e', function()
  Snacks.explorer()
end, { desc = '[E]xplorer' })

-- =====================================================================
-- Toggles
-- =====================================================================
-- Toggle cloak for env files
set('n', '<leader>tc', '<cmd>:CloakToggle<cr>', { desc = '[T]oggle Cloak for Env files' })

-- Toggle Hardtime (gives you a hardtime for not using vim correctly)
set('n', '<leader>th', '<Cmd>Hardtime toggle<CR>', { desc = '[T]oggle [H]ardtime' })

set('n', '<leader>tb', function()
  require('gitsigns').toggle_current_line_blame()
end, { desc = '[T]oggle Git Line [B]lame' })

set('n', '<leader>tn', function()
  Snacks.picker.notifications()
end, { desc = '[T]oggle [N]otifications' })

set('n', '<leader>tz', function()
  Snacks.zen()
end, { desc = '[T]oggle [Z]en Mode' })

-- =====================================================================
-- Search
-- =====================================================================
set('n', '<leader>sh', function()
  Snacks.picker.help()
end, { desc = '[S]earch [H]elp' })

set('n', '<leader>sk', function()
  Snacks.picker.keymaps()
end, { desc = '[S]earch [K]eymaps' })

set('n', '<leader>sr', function()
  Snacks.picker.registers()
end, { desc = '[S]earch [R]egisters' })

set('n', '<leader>sf', function()
  Snacks.picker.files()
end, { desc = '[S]earch [F]iles' })

set('n', '<leader>ss', function()
  Snacks.picker.smart()
end, { desc = '[S]earch [S]mart Files' })

set('n', '<leader>sg', function()
  Snacks.picker.grep()
end, { desc = '[S]earch [G]rep' })

set('n', '<leader>su', function()
  Snacks.picker.undo()
end, { desc = '[S]earch [U]ndo History' })

set('n', '<leader>/', function()
  Snacks.picker.grep_buffers()
end, { desc = '[S]earch using grep in open buffers' })

set('n', '<leader>sd', function()
  Snacks.picker.diagnostics()
end, { desc = '[S]earch [D]iagnostics' })

set('n', '<leader>sD', function()
  Snacks.picker.diagnostics_buffer()
end, { desc = '[S]earch Buffer [D]iagnostics' })

set('n', '<leader>:', function()
  Snacks.picker.command_history()
end, { desc = '[S]earch Command History' })

set('n', '<leader>sa', function()
  Snacks.picker.autocmds()
end, { desc = '[S]earch [A]utocmds' })

set('n', '<leader>sc', function()
  Snacks.picker.commands()
end, { desc = '[S]earch [C]ommands' })

--- =====================================================================
-- Neorg
-- =====================================================================
set('n', '<leader>on', '<Cmd>Neorg<CR>', { desc = '[O]pen [N]eorg' })

-- =====================================================================
-- Buffers
-- =====================================================================
set('n', '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', { desc = '[B]uffer Toggle [P]in' })
set('n', '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', { desc = '[B]uffer Delete Non-[P]inned Buffers' })
set('n', '<leader>bo', '<Cmd>BufferLineCloseOthers<CR>', { desc = '[B]uffer Delete [O]thers' })
set('n', '<leader>br', '<Cmd>BufferLineCloseRight<CR>', { desc = '[B]uffer Delete to the [R]ight' })
set('n', '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', { desc = '[B]uffer Delete to the [L]eft' })
set('n', '<S-h>', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Prev Buffer' })
set('n', '<S-l>', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Next Buffer' })

-- =====================================================================
-- Git
-- =====================================================================
set('n', '<leader>lg', function()
  Snacks.lazygit()
end, { desc = 'Open [L]azy [G]it' })

set('n', '<leader>gs', function()
  Snacks.picker.git_status()
end, { desc = 'Search [G]it [S]atus' })

set('n', '<leader>fg', function()
  Snacks.picker.git_files()
end, { desc = '[F]ind [G]it Files' })

set('n', '<leader>gb', function()
  Snacks.picker.git_branches()
end, { desc = 'Search [G]it [B]ranches' })

set('n', '<leader>gl', function()
  Snacks.picker.git_log()
end, { desc = 'Search [G]it [L]og' })

set('n', '<leader>gf', function()
  Snacks.picker.git_log_file()
end, { desc = 'Search [G]it log for current [F]ile' })

-- =====================================================================
-- LSP
-- =====================================================================
set('n', '<leader>gd', function()
  Snacks.picker.lsp_definitions()
end, { desc = '[G]oto [D]efinition' })

set('n', '<leader>gD', function()
  Snacks.picker.lsp_declarations()
end, { desc = '[G]oto [D]eclaration' })

set('n', '<leader>gr', function()
  Snacks.picker.lsp_references()
end, { desc = '[G]oto [R]eference' })

set('n', '<leader>gI', function()
  Snacks.picker.lsp_implementations()
end, { desc = '[G]oto [I]mplementation' })

set('n', '<leader>gt', function()
  Snacks.picker.lsp_type_definitions()
end, { desc = '[G]oto [T]ype Definitions' })

-- =====================================================================
-- Check
-- =====================================================================
set('n', '<leader>ct', function()
  Snacks.picker.todo_comments()
end, { desc = '[C]heck [T]odo' })

set('n', '<leader>cd', '<cmd>Trouble diagnostics toggle<cr>', { desc = '[C]heck [D]iagnostics' })

set('n', '<leader>cm', '<Cmd>Mason<CR>', { desc = '[C]heck [M]ason' })

-- =====================================================================
-- export
-- =====================================================================
set('n', '<leader>mp', function() -- Using <leader>mp for Markdown to PDF
  local current_file_path = vim.api.nvim_buf_get_name(0)

  if current_file_path == '' or not current_file_path:match '%.md$' then
    vim.notify('Cannot export: Current buffer is not a saved Markdown (.md) file.', vim.log.levels.WARN)
    return
  end

  local output_pdf_root_name = vim.fn.fnamemodify(current_file_path, ':r')
  local output_pdf_path = output_pdf_root_name .. '.pdf'

  local escaped_input_path = vim.fn.fnameescape(current_file_path)
  local escaped_output_path = vim.fn.fnameescape(output_pdf_path)

  local command_to_execute = 'md_to_pdf ' .. escaped_input_path .. ' ' .. escaped_output_path

  -- For debugging: use 'vertical terminal ' (shows output in a split window)
  -- vim.cmd('vertical terminal ' .. command_to_execute)
  vim.cmd('!' .. command_to_execute)

  vim.notify('Attempting to export ' .. current_file_path .. ' to ' .. output_pdf_path .. '...', vim.log.levels.INFO)
end, { desc = 'Export [M]arkdown to [P]DF' })
