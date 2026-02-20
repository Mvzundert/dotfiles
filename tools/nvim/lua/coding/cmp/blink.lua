return {
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    version = '*', -- Use release tags for stability
    event = 'InsertEnter',

    opts = {
      -- 'default' for mappings, but we'll customize to match your cmp config
      keymap = {
        preset = 'none',
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>'] = { 'hide' },
        ['<C-y>'] = { 'select_and_accept' },

        ['<C-p>'] = { 'select_prev', 'fallback' },
        ['<C-n>'] = { 'select_next', 'fallback' },

        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

        -- Porting your Tab logic: select next if menu is visible, otherwise fallback
        ['<Tab>'] = {
          function(cmp)
            if cmp.is_visible() then
              return cmp.select_next()
            end
          end,
          'fallback',
        },
        ['<S-Tab>'] = {
          function(cmp)
            if cmp.is_visible() then
              return cmp.select_prev()
            end
          end,
          'fallback',
        },
      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        -- If you still use Neorg, blink handles it via LSP or community providers
      },

      -- Use native Neovim snippets (Available in 0.10+)
      snippets = { preset = 'default' },

      -- Customizing the menu to look like your old setup
      completion = {
        menu = { border = 'rounded' },
        documentation = { window = { border = 'rounded' }, auto_show = true },
        ghost_text = { enabled = true },
      },
    },
  },
}
