--- defaultzone/dots.nvim - Neovim Configuration Files
--- Copyright (C) 2026 Dmitry Lyubimcev (defaultzone) <dzone@danwin1210.de>
---
--- This program is free software: you can redistribute it and/or modify
--- it under the terms of the GNU General Public License as published by
--- the Free Software Foundation, either version 3 of the License, or
--- (at your option) any later version.
---
--- This program is distributed in the hope that it will be useful,
--- but WITHOUT ANY WARRANTY; without even the implied warranty of
--- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
--- GNU General Public License for more details.
---
--- You should have received a copy of the GNU General Public License
--- along with this program. If not, see <https://www.gnu.org/licenses/>.

local module = {
    "nvim-telescope/telescope.nvim", version = "*",

    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    }
}

function module.config()
    require("telescope").setup({
        defaults = {
            mappings = {
                i = {
                    ["<esc>"] = require("telescope.actions").close
                }
            }
        },

        pickers = {
            find_files = { theme = "ivy" },
            live_grep = { theme = "ivy" }
        },

        extensions = {
            file_browser = {
                theme = "ivy",
                grouped = true,
                hide_parent_dir = true
            }
        }
    })

    require("config.keymap").init_for_telescope()
    require("telescope").load_extension("file_browser")
end

return module
