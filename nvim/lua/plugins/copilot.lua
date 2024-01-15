return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  opts = {
    suggestion = { enabled = true },
    panel = { enabled = true },
    filetypes = {
        markdown = true,
        php = true,
        rust = true,
        lua = true,
        python = true,
        go = true,
        javascript = true,
        vue = true,
        json = true,
        yaml = true,
        toml = true,
        help = true,
    },
  },
}
