vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set Neovim's default shell to Fish
vim.o.shell = 'fish'

-- Tell Fish to act as a login shell and execute commands.
-- This ensures it sources your ~/.config/fish/config.fish
vim.o.shellcmdflag = '-lc'

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    lazyrepo,
    lazypath,
  }
end

-- Create temporary cache directory for phpactor, each session gets its own
vim.env.XDG_CACHE_HOME = '/tmp/phpactor-cache-' .. tostring(vim.fn.getpid())

---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
require('lazy').setup({
  {},
  install = { colorscheme = { 'kanagawa' } },
  transparent = true,
  -- automatically check for plugin updates
  checker = { enabled = true },
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        'gzip',
        'matchit',
        'matchparen',
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },

  -- load the coding plugins
  { import = 'coding.cmp' },
  { import = 'coding.format' },
  { import = 'coding.git' },
  { import = 'coding.lsp' },
  { import = 'coding.todo' },

  -- Load the System plugins
  { import = 'system.organisation' },
  { import = 'system.typing' },

  -- Load the Looks and Feels
  { import = 'ui.filetree' },
  { import = 'ui.menu' },
  { import = 'ui.snacks' },
  { import = 'ui.themes' },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
