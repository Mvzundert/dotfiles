return {
  'folke/snacks.nvim',
  ---@type snacks.Config
  opts = {
    image = {
      force = true, -- try displaying the image, even if the terminal does not support it
      wo = {
        wrap = false,
        number = false,
        relativenumber = false,
        cursorcolumn = false,
        signcolumn = 'no',
        foldcolumn = '0',
        list = false,
        spell = false,
        statuscolumn = '',
      },
    },
  },
}
