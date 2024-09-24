return {
    "soulis-1256/eagle.nvim",
    config = function(_, opts) require("eagle").setup(opts) end,
    opts   = { render_delay = 200 }
}
