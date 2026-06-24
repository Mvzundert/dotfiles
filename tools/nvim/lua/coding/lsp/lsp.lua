vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    map('gd', vim.lsp.buf.definition, 'Goto Definition')
    map('gr', vim.lsp.buf.references, 'Goto References')
    map('K', vim.lsp.buf.hover, 'Hover Documentation')
    map('[d', vim.diagnostic.goto_prev, 'Previous Diagnostic')
    map(']d', vim.diagnostic.goto_next, 'Next Diagnostic')
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

-- Explicit server configs: ensures vim.lsp.enable() knows how to launch each one
-- regardless of Neovim's built-in server list (future-proof across versions)

vim.lsp.config['bashls'] = {
  cmd = { 'bash-language-server', 'start' },
  filetypes = { 'sh', 'bash', 'zsh' },
  single_file_support = true,
}

vim.lsp.config['pyright'] = {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = { '.git', 'pyproject.toml', 'setup.py', 'setup.cfg' },
  single_file_support = true,
}

vim.lsp.config['gopls'] = {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_markers = { 'go.mod', 'go.work', '.git' },
  single_file_support = true,
}

vim.lsp.config['rust_analyzer'] = {
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
  root_markers = { 'Cargo.toml', '.git' },
}

vim.lsp.config['ruby_lsp'] = {
  cmd = { 'ruby-lsp' },
  filetypes = { 'ruby' },
  root_markers = { 'Gemfile', '.git' },
  single_file_support = true,
}

vim.lsp.config['intelephense'] = {
  cmd = { 'intelephense', '--stdio' },
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
  'pyright',
  'gopls',
  'intelephense',
  'lua_ls',
  'ruby_lsp',
  'rust_analyzer',
})

require('mason').setup()
vim.keymap.set('n', '<leader>cm', '<cmd>Mason<CR>')
require('mason-tool-installer').setup {
  ensure_installed = {
    { 'bash-language-server', condition = function() return vim.fn.executable 'node' == 1 end },
    { 'pyright', condition = function() return vim.fn.executable 'python3' == 1 end },
    { 'blade-formatter', condition = function() return vim.fn.executable 'node' == 1 end },
    { 'dot-language-server', condition = function() return vim.fn.executable 'node' == 1 end },
    'gopls',
    { 'html-lsp', condition = function() return vim.fn.executable 'node' == 1 end },
    { 'intelephense', condition = function() return vim.fn.executable 'node' == 1 end },
    'lua-language-server',
    { 'markdownlint', condition = function() return vim.fn.executable 'node' == 1 end },
    'ruff',
    'rust-analyzer',
    'shfmt',
    'stylua',
    'taplo',
  },
}
