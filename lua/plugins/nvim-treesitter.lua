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

return {
    "nvim-treesitter/nvim-treesitter",

    lazy = false,
    build = ":TSUpdate",

    opts = {
        ensure_installed = {
            "c",
            "c3",
            "cpp",
            "lua",
            "vim",
            "vimdoc",
            "query",
            "markdown",
            "markdown_inline"
        },

        ignore_install = {},
        modules = {},

        sync_install = false,
        auto_install = true,

        highlight = {
            enable = true
        }
    }
}
