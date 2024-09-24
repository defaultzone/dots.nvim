local plugin = { "nvim-treesitter/nvim-treesitter" }

function plugin.build()
    require("nvim-treesitter.install").update({ with_sync = true })()
end

function plugin.config()
    require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
        ignore_install   = {},
        modules          = {},
        sync_install     = false,
        auto_install     = true,
        highlight        = {
            enable = true
        }
    })
end

return plugin
