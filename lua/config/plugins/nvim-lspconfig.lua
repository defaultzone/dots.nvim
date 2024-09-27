local plugin = {
    "neovim/nvim-lspconfig",
    event        = "BufReadPre",
    dependencies = {{ "folke/neodev.nvim", opts = {} }}
}

function plugin.config()
    local lspconfig       = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local server_configs  = require("config.servers")
    local lsp_defaults    = lspconfig.util.default_config

    require("lspconfig.ui.windows").default_options = { border = "rounded" }

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
    vim.diagnostic.config({
        virtual_text = true,
        underline = { Error = true },
        float = {
            border = "rounded",
            header = "",
            focusable = false,
            prefix = function(_, _, _) return "" , "String" end,
            suffix = ""
        }
    })

    vim.cmd("highlight FloatBorder ctermfg=NONE ctermbg=NONE cterm=NONE")

    lsp_defaults.capabilities = vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

    mason_lspconfig.setup_handlers({
        function(server)
            lspconfig[server].setup(server_configs[server] and server_configs[server]() or {})
        end
    })
end

return plugin
