local cmd = vim.cmd

-- If you want to see what colorschemes are already installed,
-- you can use `:Telescope colorscheme`.
--
-- Load the colorscheme here, when Autodark is not active
-- Like many other themes, this one has different styles, and you could load
-- any other, such as
-- 'tokyonight',
-- 'rose-pine',
-- 'everforest',
-- 'gruvebox',
-- 'nightfall',
-- 'vague',
-- 'catppuccin'.
cmd.colorscheme 'catppuccin'

cmd.hi 'Comment gui=none'

cmd [[
  hi Normal      guibg=NONE ctermbg=NONE
  hi NormalNC    guibg=NONE ctermbg=NONE
  hi TermNormal  guibg=NONE ctermbg=NONE
  hi TermNormalNC guibg=NONE ctermbg=NONE
]]
