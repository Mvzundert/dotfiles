require('luasnip').setup {}
require('luasnip.loaders.from_vscode').lazy_load()

require('blink.cmp').setup {
  keymap = {
    preset = 'none',
    ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
    ['<C-e>'] = { 'hide' },
    ['<C-y>'] = { 'select_and_accept' },

    ['<C-p>'] = { 'select_prev', 'fallback' },
    ['<C-n>'] = { 'select_next', 'fallback' },

    ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
    ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

    ['<Tab>'] = { 'snippet_forward', 'select_next', 'fallback' },
    ['<S-Tab>'] = { 'snippet_backward', 'select_prev', 'fallback' },
  },

  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = 'mono',
  },

  fuzzy = { implementation = 'lua' },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },

  snippets = { preset = 'luasnip' },

  completion = {
    menu = { border = 'rounded' },
    documentation = { window = { border = 'rounded' }, auto_show = true },
    ghost_text = { enabled = true },
  },
}
