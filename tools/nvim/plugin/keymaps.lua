-- =====================================================================
-- For Basic Keymaps See `:help vim.keymap.set()`
-- =====================================================================
local set = vim.keymap.set

-- =====================================================================
-- Groups for keymaps (Which-Key labels)
-- =====================================================================

-- Normal Mode Groups (Full List)
local n_groups = {
  { '<leader>s', '+[S]earch and [S]ort' },
  { '<leader>b', '+[B]uffers' },
  { '<leader>o', '+[O]rganisation' },
  { '<leader>g', '+[G]it and [G]oto Definitions' },
  { '<leader>l', '+[L]azy Git' },
  { '<leader>f', '+[F]ind' },
  { '<leader>p', '+[P]review' },
  { '<leader>r', '+[R]ename' },
  { '<leader>c', '+[C]ode and [C]heck' },
  { '<leader>x', '+[X] Diagnostics (Trouble)' },
  { '<leader>t', '+[T]oggle' },
  { '<leader>m', '+[M]arkdown' },
  { '<leader>q', '+[Q]uit' },
  { '<leader>u', '+[U]tils (System Tools)' },
  { '<leader>i', '+[I]nspect System' },
  { '<leader>h', '+[H]ardware & Permissions' },
}

-- Visual Mode Groups (Relevant only)
local v_groups = {
  { '<leader>s', '+[S]earch and [S]ort' },
  { '<leader>u', '+[U]tils (Data Manipulation)' },
  { '<leader>c', '+[C]ode' },
}

for _, group in ipairs(n_groups) do
  set('n', group[1], '', { desc = group[2] })
end

for _, group in ipairs(v_groups) do
  set('v', group[1], '', { desc = group[2] })
end

-- =====================================================================
-- Git, Goto & Rename
-- =====================================================================
set('n', '<leader>lg', function() Snacks.lazygit() end, { desc = '[L]azy [G]it' })
set('n', '<leader>rn', vim.lsp.buf.rename, { desc = '[R]ename [N]ow' })
set('n', '<leader>gd', vim.lsp.buf.definition, { desc = '[G]oto [D]efinition' })
set('n', '<leader>gD', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration' })
set('n', '<leader>gi', vim.lsp.buf.implementation, { desc = '[G]oto [I]mplementation' })
set('n', '<leader>gr', vim.lsp.buf.references, { desc = '[G]oto [R]eferences' })

-- =====================================================================
-- Code and Check
-- =====================================================================
set('n', '<leader>ct', function() Snacks.picker.todo_comments() end, { desc = '[C]heck [T]odo Comments' })
-- Visual: Search project for selected text
set('v', '<leader>cs', function() Snacks.picker.grep_visual() end, { desc = '[C]ode Search Selection' })

-- =====================================================================
-- Find & Preview
-- =====================================================================
set('n', '<leader>fc', function() Snacks.picker.files { cwd = vim.fn.stdpath 'config' } end, { desc = '[F]ind [C]onfig Files' })
set('n', '<leader>ff', function() Snacks.picker.files() end, { desc = '[F]ind [F]iles' })
set('n', '<leader>fm', function() Snacks.picker.recent { filter = { cwd = true }, cmd = "find . -type f -mmin -1440" } end, { desc = '[F]ind [M]odified (24h)' })
set('n', '<leader>pk', function() Snacks.picker.keymaps() end, { desc = '[P]review [K]eymaps' })
set('n', '<leader>pC', function() Snacks.picker.colorschemes() end, { desc = '[P]review [C]olor schemes' })
set('n', '<leader>pm', '<Cmd>Markview toggle<CR>', { desc = '[P]review [M]arkdown' })
set('n', '<leader>p?', function() require('which-key').show({ global = false }) end, { desc = '[P]review local keymaps' })

-- =====================================================================
-- Diagnostics (Trouble) - On X
-- =====================================================================
set('n', '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', { desc = '[X] Diagnostics [D]ocument' })
set('n', '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', { desc = '[X] Diagnostics [W]orkspace' })
set('n', '<leader>xl', '<cmd>Trouble loclist toggle<cr>', { desc = '[X] Diagnostics [L]oclist' })
set('n', '<leader>xq', '<cmd>Trouble qflist toggle<cr>', { desc = '[X] Diagnostics [Q]uickfix' })
set('n', '<leader>xr', '<cmd>Trouble lsp_references toggle<cr>', { desc = '[X] Diagnostics [R]eferences' })

-- =====================================================================
-- Navigation & Better Indent
-- =====================================================================
set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Better Indent (Visual Mode)
set('v', '<', '<gv')
set('v', '>', '>gv')

set('n', '<leader>-', function() require('oil').toggle_float() end, { desc = '[-] Open Oil' })
set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
set('n', '<leader>qa', '<cmd>qa<cr>', { desc = '[Q]uit [A]ll' })
set({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })
set('n', '<leader>e', function() Snacks.explorer() end, { desc = '[E]xplorer' })

-- =====================================================================
-- Toggles
-- =====================================================================
set('n', '<leader>tc', '<cmd>CloakToggle<cr>', { desc = '[T]oggle Cloak' })
set('n', '<leader>th', '<Cmd>Hardtime toggle<CR>', { desc = '[T]oggle [H]ardtime' })
set('n', '<leader>tb', function() require('gitsigns').toggle_current_line_blame() end, { desc = '[T]oggle Git Blame' })
set('n', '<leader>tz', function() Snacks.zen() end, { desc = '[T]oggle [Z]en Mode' })

-- =====================================================================
-- Search and Sort
-- =====================================================================
set('n', '<leader>sf', function() Snacks.picker.files() end, { desc = '[S]earch [F]iles' })
set('n', '<leader>ss', function() Snacks.picker.smart() end, { desc = '[S]earch [S]mart Files' })
set('n', '<leader>sg', function() Snacks.picker.grep() end, { desc = '[S]earch [G]rep' })
set('n', '<leader>su', function() Snacks.picker.undo() end, { desc = '[S]earch [U]ndo History' })
set('n', '<leader>sw', function() Snacks.picker.grep_word() end, { desc = '[S]earch Current [W]ord' })
set('n', '<leader>sc', function() Snacks.picker.command_history() end, { desc = '[S]earch [C]ommand History' })
set('n', '<leader>sh', function() Snacks.picker.search_history() end, { desc = '[S]earch [H]istory (Regex)' })

-- Sorting (Normal - Entire File)
set('n', '<leader>sS', '<cmd>%!sort<cr>', { desc = '[S]ort [S]entire file' })
set('n', '<leader>sU', '<cmd>%!sort -u<cr>', { desc = '[S]ort [U]nique file' })

-- Sorting (Visual - Selection)
set('v', '<leader>ss', ':sort<cr>', { desc = '[S]ort [S]election' })
set('v', '<leader>su', ':sort u<cr>', { desc = '[S]ort [U]nique selection' })

-- Replace
set('n', '<leader>sr', ':%s/\\<<C-r><C-w>\\>/', { desc = '[S]earch and [R]eplace word' })

-- =====================================================================
-- Buffers
-- =====================================================================
set('n', '<leader>bb', function() Snacks.picker.buffers() end, { desc = '[B]uffer [B]rowse' })
set('n', '<leader>bd', function() Snacks.bufdelete() end, { desc = '[B]uffer [D]elete' })
set('n', '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', { desc = '[B]uffer Pin' })
set('n', '<leader>bo', '<Cmd>BufferLineCloseOthers<CR>', { desc = '[B]uffer Delete Others' })
set('n', '<S-h>', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Prev Buffer' })
set('n', '<S-l>', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Next Buffer' })

-- =====================================================================
-- Inspect & Hardware
-- =====================================================================
set('n', '<leader>ii', '<cmd>r !ip -brief addr<cr>', { desc = '[I]nspect [I]nterfaces' })
set('n', '<leader>id', '<cmd>r !df -h /<cr>', { desc = '[I]nspect [D]isk usage' })
set('n', '<leader>hx', '<cmd>!chmod +x %<cr>', { desc = '[H]arden: Make Executable' })
set('n', '<leader>hm', '<cmd>r !free -h<cr>', { desc = '[H]ardware: Memory' })

-- =====================================================================
-- Utils (System Tools)
-- =====================================================================
set('n', '<leader>ud', '<cmd>r !date +\\%F<cr>', { desc = '[U]tils Insert [D]ate' })
set('n', '<leader>ut', '<cmd>r !date +\\%T<cr>', { desc = '[U]tils Insert [T]ime' })
set('n', '<leader>uc', '<cmd>.!bc<cr>', { desc = '[U]tils [C]alculate Line' })
set('n', '<leader>uh', '<cmd>r !hostname<cr>', { desc = '[U]tils Insert [H]ostname' })
set('n', '<leader>ui', '<cmd>r !hostname -i | awk \'{print $1}\'<cr>', { desc = '[U]tils Insert [I]P Address' })
set('n', '<leader>us', '<cmd>%s/\\s\\+$//e<cr>', { desc = '[U]tils Strip Whitespace' })
set('n', '<leader>un', '<cmd>vnew | setlocal buftype= buflisted<cr>', { desc = '[U]tils [N]ew Scratch' })
set('n', '<leader>up', '<cmd>let @+ = expand("%:p")<cr><cmd>echo "Path copied: " . expand("%:p")<cr>', { desc = '[U]tils Copy Path' })

-- Smart Save for Scratch Buffers
set('n', '<leader>uS', function()
  local buf_name = vim.api.nvim_buf_get_name(0)
  if buf_name == "" then
    vim.api.nvim_feedkeys(":saveas " .. vim.fn.expand("%:p:h") .. "/", "n", false)
  else
    vim.cmd('w')
  end
end, { desc = '[U]tils [S]ave Scratch' })

-- Data Manipulation (Visual Mode)
set('v', '<leader>uf', ':!column -t<cr>', { desc = '[U]tils [F]ormat Table' })
set('v', '<leader>uj', ':!jq .<cr>', { desc = '[U]tils JSON Format' })
set('v', '<leader>ue', ':!base64<cr>', { desc = '[U]tils Base64 Encode' })
set('v', '<leader>ud', ':!base64 -d<cr>', { desc = '[U]tils Base64 Decode' })
set('v', '<leader>uC', ':!sed "s/\\<./\\U&/g"<cr>', { desc = '[U]tils Title Case' })
set('v', '<leader>ul', ':!tr "[:upper:]" "[:lower:]"<cr>', { desc = '[U]tils Lowercase' })
set('v', '<leader>uu', ':!tr "[:lower:]" "[:upper:]"<cr>', { desc = '[U]tils Uppercase' })

-- =====================================================================
-- Export & Organisation
-- =====================================================================
set('n', '<leader>on', '<Cmd>Neorg<CR>', { desc = '[O]pen [N]eorg' })
set('n', '<leader>mp', function()
  local current_file_path = vim.api.nvim_buf_get_name(0)
  if current_file_path == '' or not current_file_path:match '%.md$' then
    vim.notify('Not a saved Markdown file.', vim.log.levels.WARN)
    return
  end
  local output_pdf_path = vim.fn.fnamemodify(current_file_path, ':r') .. '.pdf'
  -- vim.cmd('MarkdownPreview')
  vim.cmd('!' .. 'md_to_pdf ' .. vim.fn.fnameescape(current_file_path) .. ' ' .. vim.fn.fnameescape(output_pdf_path))
end, { desc = 'Export Markdown to PDF' })
