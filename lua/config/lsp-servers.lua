local module = {}

function module.lua_ls()
    return {
        settings = {
            Lua = {
                diagnostics = {
                    globals = {
                        "vim",
                        "api"
                    }
                },

                workspace = {
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.stdpath("config") .. "/lua"] = true
                    }
                }
            }
        }
    }
end

function module.c3_lsp()
    return {
        cmd = { "c3lsp" },
        filetypes = { "c3" },
        root_markers = { "project.json" },
        settings = {},
        name = "c3_lsp"
    }
end

return module
