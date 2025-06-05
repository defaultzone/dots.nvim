return {
    "saghen/blink.cmp",

    version = "1.*",
    dependencies = { "L3MON4D3/LuaSnip", "onsails/lspkind.nvim" },

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
                            text = function(item)
                                local kind = require("lspkind").symbol_map[item.kind] or ""
                                return kind .. " "
                            end,
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

            documentation = {
			    auto_show = true,
                auto_show_delay_ms = 0,

                draw = function(opts)
				    if opts.item and opts.item.documentation then
					    local out = require("pretty_hover.parser").parse(opts.item.documentation.value)
					    opts.item.documentation.value = out:string()
				    end

				    opts.default_implementation(opts)
			    end,
		    }
	    },

        keymap = {
            preset = "none",

            ["<Tab>"] = { "select_next", "fallback" },
            ["<S-Tab>"] = { "select_prev", "fallback" },
            ["<Enter>"] = { "accept", "fallback" },
            ["<C-up>"] = { "scroll_documentation_up", "fallback" },
            ["<C-down>"] = { "scroll_documentation_down", "fallback" }
        },

        signature = {
            enabled = true
        }
    }
}
