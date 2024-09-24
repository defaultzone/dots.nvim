local plugin = {
    "nvim-tree/nvim-tree.lua",
    opts = {
        hijack_cursor      = true,
        reload_on_bufenter = true,
        view               = { width = 60 },
        diagnostics        = { enable = true },
        renderer           = {
            add_trailing          = true,
            root_folder_label     = false,
            highlight_diagnostics = "all",
            highlight_modified    = "all"
        },

        modified = {
            enable            = true,
            show_on_dirs      = false,
            show_on_open_dirs = false
        },
    }
}

function plugin.config(_, opts)
    require("nvim-tree").setup(opts)
    vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
            require("nvim-tree.api").tree.open()
            vim.schedule(function()
                vim.cmd("wincmd p")
            end)
        end
    })
end

return plugin
