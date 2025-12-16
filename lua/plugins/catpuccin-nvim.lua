return {
    "catppuccin/nvim",

    name = "catppuccin",
    lazy = false,
    priority = 1000,

    config = function()
        vim.cmd("colorscheme " .. require("config.constants").colorscheme)
    end
}
