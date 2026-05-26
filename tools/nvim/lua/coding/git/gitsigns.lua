require('gitsigns').setup {
  current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
  signs = {
    add = { text = '┃' },
    change = { text = ' ' },
    delete = { text = ' ' },
    topdelete = { text = '‾' },
    changedelete = { text = ' ' },
    untracked = { text = '┆' },
  },
  signs_staged = {
    add = { text = '┃' },
    change = { text = '┃' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
    untracked = { text = '┆' },
  },
}
