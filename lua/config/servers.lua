local servers = {}

function servers.lua_ls()
    return {
        settings = {
            Lua = {
                diagnostics = { globals = { "vim", "api" } },
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

return servers
