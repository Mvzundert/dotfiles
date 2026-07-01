require('conform').setup {
  notify_on_error = false,
  format_on_save = function(bufnr)
    local disable_filetypes = { c = true, cpp = true }
    return {
      timeout_ms = 3000,
      async = false,
      quiet = false,
      lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
    }
  end,
  formatters_by_ft = {
    lua = { 'stylua' },
    sh = { 'shfmt' },
    php = { 'pint' },
    blade = { 'blade-formatter', 'rustywind' },
    rust = { 'rustfmt' },
    ruby = { 'rubocop' },
    python = { 'ruff' },
    elixir = { 'mix' },
    heex = { 'mix' },
    eex = { 'mix' },
  },
  formatters = {
    pint = {
      command = 'pint',
      stdin = false,
      args = function(self, ctx)
        local filename = ctx.filename or vim.api.nvim_buf_get_name(ctx.buf)
        if filename == '' then
          vim.notify('Please save the file before formatting', vim.log.levels.WARN)
          return {}
        end
        local function find_pint_config()
          local dir = vim.fs.dirname(filename)
          return vim.fs.find('pint.json', {
            path = dir,
            upward = true,
            stop = vim.loop.os_homedir(),
          })[1]
        end
        local project_config = find_pint_config()
        local args = { filename }
        if project_config then
          table.insert(args, 1, '--config')
          table.insert(args, 2, project_config)
        end
        return args
      end,
    },
  },
}
