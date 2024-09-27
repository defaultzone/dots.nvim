return {
    "nvim-treesitter/nvim-treesitter",
    lazy  = false,
    build = ":TSUpdate",
    opts  = {
        ensure_installed = require("config.env").languages,
        ignore_install   = {},
        modules          = {},
        sync_install     = false,
        auto_install     = true,
        highlight        = { enable = true }
    }
}
