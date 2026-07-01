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

-- Auto-trust phpactor project configs so per-project .phpactor.json is loaded
-- without requiring `phpactor config:trust` each time.
do
  local trust_file = vim.fs.normalize(vim.fn.stdpath('data') .. '/../phpactor/trust.json')

  local function ensure_phpactor_trust(root)
    local ok, data = pcall(vim.json.decode, table.concat(vim.fn.readfile(trust_file), '\n'))
    local trusts = ok and type(data) == 'table' and data or {}
    if not trusts[root] then
      trusts[root] = vim.json.decode('true')
      vim.fn.writefile({ vim.json.encode(trusts) }, trust_file)
    end
  end

  vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
    pattern = { '*.php', '*.blade.php' },
    group = vim.api.nvim_create_augroup('phpactor-trust', { clear = true }),
    callback = function()
      local root = vim.fs.root(0, { '.phpactor.json', 'composer.json', '.git' })
      if root then
        ensure_phpactor_trust(root)
      end
    end,
  })
end

require('mason').setup()

vim.lsp.config('*', {
  capabilities = require('blink.cmp').get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities()),
})

-- Explicit server configs: ensures vim.lsp.enable() knows how to launch each one
-- regardless of Neovim's built-in server list (future-proof across versions)

vim.lsp.config['bashls'] = {
  cmd = { 'bash-language-server', 'start' },
  filetypes = { 'sh', 'bash', 'zsh', 'fish' },
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

vim.lsp.config['dockerls'] = {
  cmd = { 'docker-langserver', '--stdio' },
  filetypes = { 'dockerfile' },
  root_markers = { 'Dockerfile', '.git' },
  single_file_support = true,
}

vim.lsp.config['marksman'] = {
  cmd = { 'marksman' },
  filetypes = { 'markdown' },
  root_markers = { '.git' },
  single_file_support = true,
}

vim.lsp.config['phpactor'] = {
  cmd = { 'phpactor', 'language-server' },
  filetypes = { 'php', 'blade' },
  root_markers = { 'composer.json', '.git' },
  cmd_env = {
    XDG_CACHE_HOME = '/tmp/phpactor-cache-' .. vim.fn.getpid(),
  },
}

vim.lsp.config['intelephense'] = {
  cmd = { 'intelephense', '--stdio' },
  filetypes = {},
  settings = {
    intelephense = {
      files = { associations = { '*.php', '*.blade.php' }, maxSize = 5000000 },
      diagnostics = { enable = true },
    },
  },
}

vim.lsp.config['lexical'] = {
  cmd = { 'lexical' },
  filetypes = { 'elixir', 'eex', 'heex' },
  root_markers = { 'mix.exs', '.git' },
}

vim.lsp.config['erlang_ls'] = {
  cmd = { 'erlang_ls' },
  filetypes = { 'erlang' },
  root_markers = { 'rebar.config', '.git' },
}

vim.lsp.config['lua_ls'] = {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  settings = {
    Lua = {
      completion = { callSnippet = 'Replace' },
    },
  },
}

vim.lsp.enable({
  'bashls',
  'dockerls',
  'gopls',
  'phpactor',
  'lexical',
  'lua_ls',
  'marksman',
  'pyright',
  'ruby_lsp',
  'rust_analyzer',
})

vim.keymap.set('n', '<leader>cm', '<cmd>Mason<CR>')
require('mason-tool-installer').setup {
  ensure_installed = {
    { 'bash-language-server', condition = function() return vim.fn.executable 'node' == 1 end },
    { 'pyright', condition = function() return vim.fn.executable 'python3' == 1 end },
    { 'blade-formatter', condition = function() return vim.fn.executable 'node' == 1 end },
    { 'dockerfile-language-server', condition = function() return vim.fn.executable 'node' == 1 end },
    { 'dot-language-server', condition = function() return vim.fn.executable 'node' == 1 end },
    'gopls',
    { 'html-lsp', condition = function() return vim.fn.executable 'node' == 1 end },
    { 'intelephense', condition = function() return vim.fn.executable 'node' == 1 end },
    'lexical',
    'lua-language-server',
    { 'markdownlint', condition = function() return vim.fn.executable 'node' == 1 end },
    'marksman',
    'ruff',
    'rust-analyzer',
    'shfmt',
    'stylua',
    'taplo',
  },
}
