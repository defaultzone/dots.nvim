return {
    plugins_directory = "../plugins",
    dependencies = { "npm", "git" },
    enable_tree_on_enter = true,

    --- Available colorschemes:
    --- "github_dark" | "github_light" | "github_dark_dimmed"
    --- "github_dark_default" | "github_light_default"
    --- "github_dark_high_contrast" | "github_light_high_contrast"
    --- "github_dark_colorblind" | "github_light_colorblind"
    --- "github_dark_tritanopia" | "github_light_tritanopia"
    colorscheme = "github_dark_dimmed",

    treesitter_languages = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline",
    },

    lsp_servers = {
        "bashls",
        "clangd",
        "cmake",
        "jsonls",
        "lua_ls",
        "rust_analyzer"
    }
}
