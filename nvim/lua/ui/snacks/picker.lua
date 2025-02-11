return {
  'folke/snacks.nvim',
  ---@type snacks.Config
  opts = {
    picker = {
      prompt = ' ',
      sources = {
        explorer = {
          layout = {
            auto_hide = { 'input' },
          },
        },
      },
      focus = 'input',
      layout = {
        cycle = true,
        --- Use the telescope layout or vscode if the window is too narrow
        preset = function()
          return vim.o.columns >= 120 and 'telescope' or 'vscode'
        end,
      },
      ---@class snacks.picker.matcher.Config
      matcher = {
        fuzzy = true, -- use fuzzy matching
        smartcase = true, -- use smartcase
        ignorecase = true, -- use ignorecase
        sort_empty = false, -- sort results when the search string is empty
        filename_bonus = true, -- give bonus for matching file names (last part of the path)
        file_pos = true, -- support patterns like `file:line:col` and `file:line`
        -- the bonusses below, possibly require string concatenation and path normalization,
        -- so this can have a performance impact for large lists and increase memory usage
        cwd_bonus = false, -- give bonus for matching files in the cwd
        frecency = false, -- frecency bonus
        history_bonus = false, -- give more weight to chronological order
      },
      sort = {
        -- default sort is by score, text length and index
        fields = { 'score:desc', '#text', 'idx' },
      },
      ui_select = true, -- replace `vim.ui.select` with the snacks picker
      ---@class snacks.picker.formatters.Config
      formatters = {
        text = {
          ft = nil, ---@type string? filetype for highlighting
        },
        file = {
          filename_first = false, -- display filename before the file path
          truncate = 40, -- truncate the file path to (roughly) this length
          filename_only = false, -- only show the filename
          icon_width = 2, -- width of the icon (in characters)
        },
        selected = {
          show_always = false, -- only show the selected column when there are multiple selections
          unselected = true, -- use the unselected icon for unselected items
        },
        severity = {
          icons = true, -- show severity icons
          level = false, -- show severity level
          ---@type "left"|"right"
          pos = 'left', -- position of the diagnostics
        },
      },
      ---@class snacks.picker.previewers.Config
      previewers = {
        git = {
          native = false, -- use native (terminal) or Neovim for previewing git diffs and commits
        },
        file = {
          max_size = 1024 * 1024, -- 1MB
          max_line_length = 500, -- max line length
          ft = nil, ---@type string? filetype for highlighting. Use `nil` for auto detect
        },
        man_pager = nil, ---@type string? MANPAGER env to use for `man` preview
      },
      ---@class snacks.picker.jump.Config
      jump = {
        jumplist = true, -- save the current position in the jumplist
        tagstack = false, -- save the current position in the tagstack
        reuse_win = false, -- reuse an existing window if the buffer is already open
        close = true, -- close the picker when jumping/editing to a location (defaults to true)
        match = false, -- jump to the first match position. (useful for `lines`)
      },
      toggles = {
        follow = 'f',
        hidden = 'h',
        ignored = 'i',
        modified = 'm',
        regex = { icon = 'R', value = false },
      },
      win = {
        -- input window
        input = {
          keys = {
            -- to close the picker on ESC instead of going to normal mode,
            -- add the following keymap to your config
            -- ["<Esc>"] = { "close", mode = { "n", "i" } },
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
            ['<c-z><c-j>'] = { 'layout_bottom', mode = { 'i', 'n' } },
            ['<c-z>k'] = { 'layout_top', mode = { 'i', 'n' } },
            ['<c-z><c-k>'] = { 'layout_top', mode = { 'i', 'n' } },
            ['<c-z>l'] = { 'layout_right', mode = { 'i', 'n' } },
            ['<c-z><c-l>'] = { 'layout_right', mode = { 'i', 'n' } },
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
        -- result list window
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
            ['<c-z><c-j>'] = { 'layout_bottom', mode = { 'i', 'n' } },
            ['<c-z>k'] = { 'layout_top', mode = { 'i', 'n' } },
            ['<c-z><c-k>'] = { 'layout_top', mode = { 'i', 'n' } },
            ['<c-z>l'] = { 'layout_right', mode = { 'i', 'n' } },
            ['<c-z><c-l>'] = { 'layout_right', mode = { 'i', 'n' } },
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
        -- preview window
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
      ---@class snacks.picker.icons
      icons = {
        files = {
          enabled = true, -- show file icons
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
          -- selected = " ",
        },
        git = {
          enabled = true, -- show git icons
          commit = '󰜘 ', -- used by git log
          staged = '●', -- staged changes. always overrides the type icons
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
      ---@class snacks.picker.db.Config
      db = {
        -- path to the sqlite3 library
        -- If not set, it will try to load the library by name.
        -- On Windows it will download the library from the internet.
        sqlite3_path = nil, ---@type string?
      },
      ---@class snacks.picker.debug
      debug = {
        scores = false, -- show scores in the list
        leaks = false, -- show when pickers don't get garbage collected
        explorer = false, -- show explorer debug info
        files = false, -- show file debug info
        grep = false, -- show file debug info
        extmarks = false, -- show extmarks errors
      },
    },
  },
}
