return {
    plugins_directory = "../plugins",
    dependencies = { "npm", "git", "c3lsp" },
    enable_tree_on_enter = true,
    colorscheme = "catppuccin-mocha",

    treesitter_languages = {
        "c",
        "c3",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline"
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
