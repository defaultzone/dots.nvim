return {
    "williamboman/mason-lspconfig.nvim",
    event        = "BufReadPre",
    dependencies = "williamboman/mason.nvim",
    opts         = {
        ensure_installed       = require("config.env").servers,
        automatic_installation = true
    }
}
