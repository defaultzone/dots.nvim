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

--- nvim-telescope/telescope-file-browser.nvim: select path and yank it #327
--- https://github.com/nvim-telescope/telescope-file-browser.nvim/issues/327#issuecomment-179359189i8
function module:get_mappings()
    return {
        i = {
            ["<C-y>"] = function()
                local entry = require("telescope.actions.state").get_selected_entry()
                local cb_opts = vim.opt.clipboard:get()

                local path = entry.path
                local _, pos = string.find(path, vim.uv.cwd(), 1, true)

                if pos ~= nil then
                    path = string.sub(path, pos + 2 --[[ +1 and '/' character ]])
                end

                if vim.tbl_contains(cb_opts, "unnamed") then
                    vim.fn.setreg("*", path)
                end

                if vim.tbl_contains(cb_opts, "unnamedplus") then
                    vim.fn.setreg("+", path)
                end

                vim.fn.setreg("", path)
            end
        }
    }
end

function module.config()
    local mappings = module:get_mappings()

    require("telescope").setup({
        defaults = {
            mappings = {
                i = {
                    ["<esc>"] = require("telescope.actions").close
                }
            }
        },

        pickers = {
            find_files = { theme = "ivy", mappings = mappings },
            live_grep = { theme = "ivy", mappings = mappings },
            git_status = { theme = "ivy", mappings = mappings },
            buffers = {
                theme = "ivy",
                mappings = mappings,
                ignore_current_buffer = true,
                sort_mru = true
            }
        },

        extensions = {
            file_browser = {
                theme = "ivy",
                mappings = mappings,
                grouped = true,
                hide_parent_dir = true
            }
        }
    })

    require("config.keymap").init_for_telescope()
    require("telescope").load_extension("file_browser")
end

return module
