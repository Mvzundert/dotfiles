return {
  "rcarriga/nvim-notify",
    keys = {
       { "<leader>tn", "<cmd>Telescope notify<cr>", desc = "Notification history" }
    },
    opts = {
        background_colour = "#000000",
        render = "wrapped-compact",
        topdown = false,
     }
}
