return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      'bash',
      'php',
      'python',
      'ruby',
      'rust',
      'go',
      'javascript',
      'lua',
      'luadoc',
      'markdown',
      'vim',
      'vimdoc',
    },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
}
