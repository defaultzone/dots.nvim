return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    cmd          = "MasonToolsUpdate",
    event        = "BufReadPre",
    dependencies = "williamboman/mason.nvim",
    opts         = {
        auto_update      = true,
        run_on_start     = true,
        ensure_installed = require("config.env").tools
    }
}
