return {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config       = function(_, opts) require("nvim-tree").setup(opts) end,
    opts         = {
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
