return {
    "tris203/hawtkeys.nvim",
    config = true,
    opts = {
        homerow = 2, -- the row you want to use as the homerow, default is 2
        powerFingers = { 2, 3, 6, 7 }, -- the fingers you want to use as the powerfingers, default is {2,3,6,7}
        keyboardLayout = "qwerty", -- the keyboard layout you use, default is qwerty
        customMaps = {
        },
        highlights = { -- these are the highlight used in search mode
            HawtkeysMatchGreat = { fg = "green", bold = true },
            HawtkeysMatchGood = { fg = "green"},
            HawtkeysMatchOk = { fg = "yellow" },
            HawtkeysMatchBad = { fg = "red" },
        },
            -- If you use whichkey.register with an alias eg wk.register
            ["wk.register"] = {
                method = "which_key",
            },
            -- If you use lazy.nvim's keys property to configure keymaps in your plugins
            ["lazy"] = {
                method = "lazy",
            },
        },
        keys = {
        }
 }
