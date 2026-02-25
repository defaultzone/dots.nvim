return {
    "saghen/blink.cmp",

    version = "1.*",
    dependencies = { "L3MON4D3/LuaSnip" },

    opts = {
        snippets = {
            preset = "luasnip"
        },

        completion = {
		    menu = {
                border = "none",
                draw = {
                    columns = {
                        { "kind_icon", "label", gap = 1 },
                        { "kind" },
                    },

                    components = {
                        kind_icon = {
                            text = function(item) return "" end,
                            highlight = "CmpItemKind",
                        },

                        label = {
                            text = function(item) return item.label end,
                            highlight = "CmpItemAbbr",
                        },

                        kind = {
                            text = function(item) return item.kind end,
                            highlight = "CmpItemKind",
                        },
                    },
                }
            },
	    },

        keymap = {
            preset = "none",
            ["<Tab>"] = { "select_next", "fallback" },
            ["<S-Tab>"] = { "select_prev", "fallback" },
            ["<Enter>"] = { "accept", "fallback" },
            ["<C-up>"] = { "scroll_documentation_up", "fallback" },
            ["<C-down>"] = { "scroll_documentation_down", "fallback" }
        }
    }
}
