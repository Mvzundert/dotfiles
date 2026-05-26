require('snacks').setup {
  bigfile = { enabled = true },
  quickfile = { enabled = true },
  indent = { enabled = true },
  input = { enabled = true },
  notifier = { enabled = true, timeout = 3000 },
  scroll = { enabled = true },
  statuscolumn = { enabled = true },
  words = { enabled = true },
  scope = { enabled = true },
  terminal = { enabled = true },
  zen = { enabled = true },
  image = { enabled = true },
  picker = {
    prompt = ' ',
    sources = {
      explorer = {
        hidden = true,
        ignored = true,
        layout = {
          auto_hide = { 'input' },
        },
      },
    },
    focus = 'input',
    layout = {
      cycle = true,
      preset = function()
        return vim.o.columns >= 120 and 'telescope' or 'vscode'
      end,
    },
    matcher = {
      fuzzy = true,
      smartcase = true,
      ignorecase = true,
      sort_empty = false,
      filename_bonus = true,
      file_pos = true,
      cwd_bonus = false,
      frecency = false,
      history_bonus = false,
    },
    sort = {
      fields = { 'score:desc', '#text', 'idx' },
    },
    ui_select = true,
    formatters = {
      text = {
        ft = nil,
      },
      file = {
        filename_first = true,
        truncate = 40,
        filename_only = false,
        icon_width = 2,
      },
      selected = {
        show_always = false,
        unselected = true,
      },
      severity = {
        icons = true,
        level = false,
        pos = 'left',
      },
    },
    previewers = {
      git = {
        native = false,
      },
      file = {
        max_size = 1024 * 1024,
        max_line_length = 500,
        ft = nil,
      },
      man_pager = nil,
    },
    jump = {
      jumplist = true,
      tagstack = false,
      reuse_win = false,
      close = true,
      match = false,
    },
    toggles = {
      follow = 'f',
      hidden = 'h',
      ignored = 'i',
      modified = 'm',
      regex = { icon = 'R', value = false },
    },
    win = {
      input = {
        keys = {
          ['/'] = 'toggle_focus',
          ['<C-Down>'] = { 'history_forward', mode = { 'i', 'n' } },
          ['<C-Up>'] = { 'history_back', mode = { 'i', 'n' } },
          ['<C-c>'] = { 'close', mode = 'i' },
          ['<C-w>'] = { '<c-s-w>', mode = { 'i' }, expr = true, desc = 'delete word' },
          ['<CR>'] = { 'confirm', mode = { 'n', 'i' } },
          ['<Down>'] = { 'list_down', mode = { 'i', 'n' } },
          ['<Esc>'] = 'close',
          ['<S-CR>'] = { { 'pick_win', 'jump' }, mode = { 'n', 'i' } },
          ['<S-Tab>'] = { 'select_and_prev', mode = { 'i', 'n' } },
          ['<Tab>'] = { 'select_and_next', mode = { 'i', 'n' } },
          ['<Up>'] = { 'list_up', mode = { 'i', 'n' } },
          ['<a-d>'] = { 'inspect', mode = { 'n', 'i' } },
          ['<a-f>'] = { 'toggle_follow', mode = { 'i', 'n' } },
          ['<a-h>'] = { 'toggle_hidden', mode = { 'i', 'n' } },
          ['<a-i>'] = { 'toggle_ignored', mode = { 'i', 'n' } },
          ['<a-m>'] = { 'toggle_maximize', mode = { 'i', 'n' } },
          ['<a-p>'] = { 'toggle_preview', mode = { 'i', 'n' } },
          ['<a-w>'] = { 'cycle_win', mode = { 'i', 'n' } },
          ['<c-a>'] = { 'select_all', mode = { 'n', 'i' } },
          ['<c-b>'] = { 'preview_scroll_up', mode = { 'i', 'n' } },
          ['<c-d>'] = { 'list_scroll_down', mode = { 'i', 'n' } },
          ['<c-f>'] = { 'preview_scroll_down', mode = { 'i', 'n' } },
          ['<c-g>'] = { 'toggle_live', mode = { 'i', 'n' } },
          ['<c-j>'] = { 'list_down', mode = { 'i', 'n' } },
          ['<c-k>'] = { 'list_up', mode = { 'i', 'n' } },
          ['<c-n>'] = { 'list_down', mode = { 'i', 'n' } },
          ['<c-p>'] = { 'list_up', mode = { 'i', 'n' } },
          ['<c-q>'] = { 'qflist', mode = { 'i', 'n' } },
          ['<c-s>'] = { 'edit_split', mode = { 'i', 'n' } },
          ['<c-u>'] = { 'list_scroll_up', mode = { 'i', 'n' } },
          ['<c-v>'] = { 'edit_vsplit', mode = { 'i', 'n' } },
          ['<c-z>h'] = { 'layout_left', mode = { 'i', 'n' } },
          ['<c-z><c-h>'] = { 'layout_left', mode = { 'i', 'n' } },
          ['<c-z>j'] = { 'layout_bottom', mode = { 'i', 'n' } },
          ['<c-z><c-k>'] = { 'layout_top', mode = { 'i', 'n' } },
          ['<c-z>l'] = { 'layout_right', mode = { 'i', 'n' } },
          ['?'] = 'toggle_help_input',
          ['G'] = 'list_bottom',
          ['gg'] = 'list_top',
          ['j'] = 'list_down',
          ['k'] = 'list_up',
          ['q'] = 'close',
        },
        b = {
          minipairs_disable = true,
        },
      },
      list = {
        keys = {
          ['/'] = 'toggle_focus',
          ['<2-LeftMouse>'] = 'confirm',
          ['<CR>'] = 'confirm',
          ['<Down>'] = 'list_down',
          ['<Esc>'] = 'close',
          ['<S-CR>'] = { { 'pick_win', 'jump' } },
          ['<S-Tab>'] = { 'select_and_prev', mode = { 'n', 'x' } },
          ['<Tab>'] = { 'select_and_next', mode = { 'n', 'x' } },
          ['<Up>'] = 'list_up',
          ['<a-d>'] = 'inspect',
          ['<a-f>'] = 'toggle_follow',
          ['<a-h>'] = 'toggle_hidden',
          ['<a-i>'] = 'toggle_ignored',
          ['<a-m>'] = 'toggle_maximize',
          ['<a-p>'] = 'toggle_preview',
          ['<a-w>'] = 'cycle_win',
          ['<c-a>'] = 'select_all',
          ['<c-b>'] = 'preview_scroll_up',
          ['<c-d>'] = 'list_scroll_down',
          ['<c-f>'] = 'preview_scroll_down',
          ['<c-j>'] = 'list_down',
          ['<c-k>'] = 'list_up',
          ['<c-n>'] = 'list_down',
          ['<c-p>'] = 'list_up',
          ['<c-s>'] = 'edit_split',
          ['<c-u>'] = 'list_scroll_up',
          ['<c-v>'] = 'edit_vsplit',
          ['<c-z>h'] = { 'layout_left', mode = { 'i', 'n' } },
          ['<c-z><c-h>'] = { 'layout_left', mode = { 'i', 'n' } },
          ['<c-z>j'] = { 'layout_bottom', mode = { 'i', 'n' } },
          ['<c-z><c-k>'] = { 'layout_top', mode = { 'i', 'n' } },
          ['<c-z>l'] = { 'layout_right', mode = { 'i', 'n' } },
          ['?'] = 'toggle_help_list',
          ['G'] = 'list_bottom',
          ['gg'] = 'list_top',
          ['i'] = 'focus_input',
          ['j'] = 'list_down',
          ['k'] = 'list_up',
          ['q'] = 'close',
          ['zb'] = 'list_scroll_bottom',
          ['zt'] = 'list_scroll_top',
          ['zz'] = 'list_scroll_center',
        },
        wo = {
          conceallevel = 2,
          concealcursor = 'nvc',
        },
      },
      preview = {
        keys = {
          ['<Esc>'] = 'close',
          ['q'] = 'close',
          ['i'] = 'focus_input',
          ['<ScrollWheelDown>'] = 'list_scroll_wheel_down',
          ['<ScrollWheelUp>'] = 'list_scroll_wheel_up',
          ['<a-w>'] = 'cycle_win',
        },
      },
    },
    icons = {
      files = {
        enabled = true,
      },
      keymaps = {
        nowait = '󰓅 ',
      },
      tree = {
        vertical = '│ ',
        middle = '├╴',
        last = '└╴',
      },
      undo = {
        saved = ' ',
      },
      ui = {
        live = '󰐰 ',
        hidden = 'h',
        ignored = 'i',
        follow = 'f',
        selected = '● ',
        unselected = '○ ',
      },
      git = {
        enabled = true,
        commit = '󰜘 ',
        staged = '●',
        added = '',
        deleted = '',
        ignored = ' ',
        modified = '○',
        renamed = '',
        unmerged = ' ',
        untracked = '?',
      },
      diagnostics = {
        Error = ' ',
        Warn = ' ',
        Hint = ' ',
        Info = ' ',
      },
      kinds = {
        Array = ' ',
        Boolean = '󰨙 ',
        Class = ' ',
        Color = ' ',
        Control = ' ',
        Collapsed = ' ',
        Constant = '󰏿 ',
        Constructor = ' ',
        Copilot = ' ',
        Enum = ' ',
        EnumMember = ' ',
        Event = ' ',
        Field = ' ',
        File = ' ',
        Folder = ' ',
        Function = '󰊕 ',
        Interface = ' ',
        Key = ' ',
        Keyword = ' ',
        Method = '󰊕 ',
        Module = ' ',
        Namespace = '󰦮 ',
        Null = ' ',
        Number = '󰎠 ',
        Object = ' ',
        Operator = ' ',
        Package = ' ',
        Property = ' ',
        Reference = ' ',
        Snippet = '󱄽 ',
        String = ' ',
        Struct = '󰆼 ',
        Text = ' ',
        TypeParameter = ' ',
        Unit = ' ',
        Unknown = ' ',
        Value = ' ',
        Variable = '󰀫 ',
      },
    },
    db = {
      sqlite3_path = nil,
    },
    debug = {
      scores = false,
      leaks = false,
      explorer = false,
      files = false,
      grep = false,
      extmarks = false,
    },
  },
  dashboard = {
    enabled = true,
    width = 80,
    row = nil,
    col = nil,
    pane_gap = 4,
    autokeys = '1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ',
    preset = {
      pick = nil,
      keys = {
        { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
        { icon = ' ', key = 'g', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
        { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
        { icon = ' ', key = 'c', desc = 'Config', action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
        { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
      },
      header = [[
=================     ===============     ===============   ========  ========
\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //
||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||
|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||
|| . .||   ||. _-|| ||-_ . .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . ||
||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||
|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||
||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||
||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||
||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||
||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||
||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||
||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||
||.=='    _-'                                                     `' |  /==.||
=='    _-'                                                           \/    `==
\   _-'                                                                `-_   /
`''                                                                        ``'
]],
    },
    formats = {
      icon = function(item)
        if item.file and item.icon == 'file' or item.icon == 'directory' then
          return M.icon(item.file, item.icon)
        end
        return { item.icon, width = 2, hl = 'icon' }
      end,
      footer = { '%s', align = 'center' },
      header = { '%s', align = 'center' },
      file = function(item, ctx)
        local fname = vim.fn.fnamemodify(item.file, ':~')
        fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
        if #fname > ctx.width then
          local dir = vim.fn.fnamemodify(fname, ':h')
          local file = vim.fn.fnamemodify(fname, ':t')
          if dir and file then
            file = file:sub(-(ctx.width - #dir - 2))
            fname = dir .. '/…' .. file
          end
        end
        local dir, file = fname:match '^(.*)/(.+)$'
        return dir and { { dir .. '/', hl = 'dir' }, { file, hl = 'file' } } or { { fname, hl = 'file' } }
      end,
    },
    sections = {
      { section = 'header' },
      { section = 'keys', gap = 1, padding = 1 },
    },
  },
}

_G.dd = function(...)
  Snacks.debug.inspect(...)
end
_G.bt = function()
  Snacks.debug.backtrace()
end
vim.print = _G.dd

Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map '<leader>tr'
Snacks.toggle.line_number():map '<leader>tl'
Snacks.toggle.treesitter():map '<leader>tT'
Snacks.toggle.inlay_hints():map '<leader>ti'
Snacks.toggle.dim():map '<leader>td'
Snacks.toggle.zen():map '<leader>uz'
Snacks.toggle.diagnostics():map '<leader>ud'

vim.keymap.set('n', '<leader><space>', function()
  Snacks.picker.smart()
end, { desc = 'Smart Find Files' })

vim.keymap.set('n', '<leader>,', function()
  Snacks.picker.buffers()
end, { desc = 'Buffers' })

vim.keymap.set('n', '<leader>/', function()
  Snacks.picker.grep()
end, { desc = 'Grep' })

vim.keymap.set('n', '<leader>:', function()
  Snacks.picker.command_history()
end, { desc = 'Command History' })

vim.keymap.set('n', 'gd', function()
  Snacks.picker.lsp_definitions()
end, { desc = 'Goto Definition' })

vim.keymap.set('n', 'gr', function()
  Snacks.picker.lsp_references()
end, { nowait = true, desc = 'References' })

vim.keymap.set('n', 'gi', function()
  Snacks.picker.lsp_implementations()
end, { desc = 'Goto Implementation' })

vim.keymap.set('n', '<leader>tt', function()
  Snacks.terminal()
end, { desc = 'Toggle Terminal' })

vim.keymap.set('n', '<leader>e', function()
  Snacks.explorer()
end, { desc = 'File Explorer' })

vim.keymap.set('n', '<leader>uz', function()
  Snacks.toggle.zen()
end, { desc = 'Toggle Zen Mode' })
