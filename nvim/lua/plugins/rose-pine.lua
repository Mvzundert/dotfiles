return {
    "rose-pine/neovim",
    lazy = false,
    name = "rose-pine",
    priority = 1000,
    opts = {
        variant = "moon", -- auto, main, moon, or dawn
        dark_variant = "main", -- main, moon, or dawn
        dim_inactive_windows = false,
        extend_background_behind_borders = true,

        styles = {
            bold = true,
            italic = true,
            transparency = true,
        },
    },
}
