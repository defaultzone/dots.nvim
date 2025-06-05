return {
    "rachartier/tiny-inline-diagnostic.nvim",

    event = "VeryLazy",
    priority = 1000,

    opts = {
        preset = "powerline",
        options = {
            multilines = {
                enabled = true,
                always_show = true
            }
        }
    },
}
