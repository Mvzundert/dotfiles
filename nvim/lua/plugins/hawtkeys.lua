return {
    "tris203/hawtkeys.nvim",
    config = true,
    opts = {
        -- If you use whichkey.register with an alias eg wk.register
        ["wk.register"] = {
            method = "which_key",
        },
        -- If you use lazy.nvim's keys property to configure keymaps in your plugins
        ["lazy"] = {
            method = "lazy",
        },
    }
 }
