return { -- Autoformat
  'stevearc/conform.nvim',
  lazy = false,
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      return {
        timeout_ms = 3000,
        async = false, -- not recommended to change
        quiet = false, -- not recommended to change
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      sh = { 'shfmt' },
      php = { 'pint' },
      blade = { 'blade-formatter', 'rustywind' },
      rust = { 'rustfmt' },
    },
    formatters = {
      pint = {
        command = 'pint',
        stdin = false, -- Important: Pint operates on files directly
        args = function(self, ctx)
          local filename = ctx.filename or vim.api.nvim_buf_get_name(ctx.buf)

          -- Handle unsaved buffers
          if filename == '' then
            vim.notify('Please save the file before formatting', vim.log.levels.WARN)
            return {}
          end

          -- Find project-specific config
          local function find_pint_config()
            local dir = vim.fs.dirname(filename)
            return vim.fs.find('pint.json', {
              path = dir,
              upward = true,
              stop = vim.loop.os_homedir(),
            })[1]
          end

          local project_config = find_pint_config()
          local default_config = vim.fn.expand '~/code/cerberos/internal/coding_standards/pint/pint.json'

          -- Build arguments
          local args = { filename }
          if project_config then
            table.insert(args, 1, '--config')
            table.insert(args, 2, project_config)
          else
            table.insert(args, 1, '--config')
            table.insert(args, 2, default_config)
          end

          return args
        end,
      },
    },
  },
}
