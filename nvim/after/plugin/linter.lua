vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

require('lint').linters_by_ft = {
  php = {'phpcs',}
}

local phpcs = require('lint').linters.phpcs
phpcs.args = {
  '-q',
  '--standard=~/.crbcs/phpcs/ruleset.xml',
  '--report=json',
  '-'
}
