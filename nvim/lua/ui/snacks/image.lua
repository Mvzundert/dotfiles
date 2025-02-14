return {
  'folke/snacks.nvim',
  ---@type snacks.Config
  opts = {
    image = {
      formats = { 'png', 'jpg', 'jpeg', 'gif', 'bmp', 'webp', 'tiff', 'heic', 'avif', 'mp4', 'mov', 'avi', 'mkv', 'webm' },
      force = false, -- try displaying the image, even if the terminal does not support it
      markdown = {
        -- enable image viewer for markdown files
        -- if your env doesn't support unicode placeholders, this will be disabled
        enabled = true,
        max_width = 80,
        max_height = 40,
      },
      -- window options applied to windows displaying image buffers
      -- an image buffer is a buffer with `filetype=image`
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
