require('mini.icons').setup()
MiniIcons.mock_nvim_web_devicons()

require('mini.cursorword').setup()

require('mini.indentscope').setup()

require('mini.surround').setup()

require('mini.ai').setup { n_lines = 500 }

require('mini.move').setup {
  mappings = {
    left = '<A-Left>',
    right = '<A-Right>',
    down = '<A-Down>',
    up = '<A-Up>',
  },
  options = {
    reindent_linewise = true,
  },
}
