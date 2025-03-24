local cmd = vim.cmd

-- If you want to see what colorschemes are already installed,
-- you can use `:Telescope colorscheme`.
--
-- Load the colorscheme here, when Autodark is not active
-- Like many other themes, this one has different styles, and you could load
-- any other, such as 'tokyonight', 'rose-pine', 'everforest', 'moonfly', 'nightfly', 'vague'or 'catppuccin'.
cmd.colorscheme 'rose-pine'

cmd.hi 'Comment gui=none'
