return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'olimorris/neotest-phpunit',
    'V13Axel/neotest-pest',
  },
  opts = {
    -- Can be a list of adapters like what neotest expects,
    -- or a list of adapter names,
    -- or a table of adapter names, mapped to adapter configs.
    -- The adapter will then be automatically loaded with the config.
    adapters = {
      ['neotest-pest'] = {
        -- Ignore these directories when looking for tests
        -- -- Default: { "vendor", "node_modules" }
        ignore_dirs = { 'vendor', 'node_modules' },

        -- Specify suffixes for files that should be considered tests
        -- -- Default: { "Test.php" }
        test_file_suffixes = { 'Test.php', '_test.php', 'PestTest.php' },

        -- Run N tests in parallel, <=1 doesn't pass --parallel to pest at all
        -- -- Default: 0
        parallel = 10,

        -- Enable ["compact" output printer](https://pestphp.com/docs/optimizing-tests#content-compact-printer)
        -- -- Default: false
        compact = false,
      },

      ['neotest-phpunit'] = {
        root_ignore_files = { 'tests/Pest.php' },
        phpunit_bin = 'vendor/bin/phpunit',
        phpunit_args = {
          '--colors=always',
          '--testdox',
          '--stop-on-failure',
          '--verbose',
        },
        filter_dirs = { 'vendor' },
        phpunit_cmd = function()
          return 'vendor/bin/phpunit'
        end,
      },
    },
    -- Example for loading neotest-golang with a custom config
    -- adapters = {
    --   ["neotest-golang"] = {
    --     go_test_args = { "-v", "-race", "-count=1", "-timeout=60s" },
    --     dap_go_enabled = true,
    --   },
    -- },
    status = { virtual_text = true },
    output = { open_on_run = true },
    quickfix = {
      open = function()
        require('trouble').open { mode = 'quickfix', focus = false }
      end,
    },
  },
  config = function(_, opts)
    local neotest_ns = vim.api.nvim_create_namespace 'neotest'
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          -- Replace newline and tab characters with space for more compact diagnostics
          local message = diagnostic.message:gsub('\n', ' '):gsub('\t', ' '):gsub('%s+', ' '):gsub('^%s+', '')
          return message
        end,
      },
    }, neotest_ns)

    if opts.adapters then
      local adapters = {}
      for name, config in pairs(opts.adapters or {}) do
        if type(name) == 'number' then
          if type(config) == 'string' then
            config = require(config)
          end
          adapters[#adapters + 1] = config
        elseif config ~= false then
          local adapter = require(name)
          if type(config) == 'table' and not vim.tbl_isempty(config) then
            local meta = getmetatable(adapter)
            if adapter.setup then
              adapter.setup(config)
            elseif adapter.adapter then
              adapter.adapter(config)
              adapter = adapter.adapter
            elseif meta and meta.__call then
              adapter(config)
            else
              error('Adapter ' .. name .. ' does not support setup')
            end
          end
          adapters[#adapters + 1] = adapter
        end
      end
      opts.adapters = adapters
    end

    require('neotest').setup(opts)
  end,
}
