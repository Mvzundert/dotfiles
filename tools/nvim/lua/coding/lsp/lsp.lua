return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      'Saghen/blink.cmp',
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('<leader>rn', vim.lsp.buf.rename, 'Rename')
          map('<leader>ca', vim.lsp.buf.code_action, 'Code Action')
          map('gD', vim.lsp.buf.declaration, 'Goto Declaration')

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end

          vim.lsp.inline_completion.enable()
        end,
      })

      vim.lsp.config('*', {
        capabilities = require('blink.cmp').get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities()),
      })

      vim.lsp.config['intelephense'] = {
        filetypes = { 'php', 'blade', 'php_only' },
        settings = {
          intelephense = {
            files = { associations = { '*.php', '*.blade.php' }, maxSize = 5000000 },
            diagnostics = { enable = true },
          },
        },
      }

      vim.lsp.config['lua_ls'] = {
        settings = {
          Lua = {
            completion = { callSnippet = 'Replace' },
          },
        },
      }

      vim.lsp.enable({
        'bashls',
        'basedpyright',
        'gopls',
        'intelephense',
        'lua_ls',
        'ruby_lsp',
        'rust_analyzer',
      })

      require('mason').setup()
      vim.keymap.set('n', '<leader>cm', '<cmd>Mason<CR>')
      require('mason-tool-installer').setup({
        ensure_installed = {
          'bash-language-server',
          'basedpyright',
          'blade-formatter',
          'dot-language-server',
          'gopls',
          'html-lsp',
          'intelephense',
          'lua-language-server',
          'markdownlint',
          'rubocop',
          'ruby-lsp',
          'ruff',
          'rust-analyzer',
          'shfmt',
          'stylua',
          'taplo',
        },
      })
    end,
  },
}
