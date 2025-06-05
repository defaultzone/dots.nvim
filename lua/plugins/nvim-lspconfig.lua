local module = {
    "neovim/nvim-lspconfig",

    event = "BufReadPre",
    dependencies = {
        "saghen/blink.cmp",
        { "folke/neodev.nvim", opts = {} }
    }
}

function module.config()
    local server_configs = require("config.lsp-servers")

    require("lspconfig.ui.windows").default_options = { border = "rounded" }

    vim.diagnostic.config({
        float = {
            border = "rounded",
            header = "",
            focusable = false,
            suffix = "",
            prefix = function(_, _, _)
                return "", "String"
            end
        },

        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = " ",
                [vim.diagnostic.severity.WARN] = " ",
                [vim.diagnostic.severity.INFO] = " ",
                [vim.diagnostic.severity.HINT] = " "
            }
        }
    })

    for server_name, server_information in pairs(server_configs) do
        local config = server_information()

        config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)

        vim.lsp.config[server_name] = config
    end
end

return module
