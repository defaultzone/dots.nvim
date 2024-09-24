local plugin = {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim"
    }
}

function plugin.config()
    local mason                = require("mason")
    local mason_lspconfig      = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")
    local env                  = require("config.env")

    mason.setup({ ui = { border = "rounded" } })
    mason_lspconfig.setup({ ensure_installed = env.servers })
    mason_tool_installer.setup({ ensure_installed = env.tools })
end

return plugin
