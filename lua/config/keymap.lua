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

local module = {}

function module.init_for_telescope()
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "f", builtin.find_files, { desc = "Telescope Find Files" })
    vim.keymap.set("n", "R", builtin.live_grep, { desc = "Telescope Live Grep" })

    vim.keymap.set("n", "F", require("telescope").extensions.file_browser.file_browser,
                   { desc = "Telescope File Browser" })
end

function module.init_toggleterm_keymap()
    vim.keymap.set("n", "r", ":ToggleTerm<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<esc>", function()
        local terminal = require("toggleterm.terminal")
        local focused_terminal = terminal.get(terminal.get_focused_id())

        if focused_terminal then
            focused_terminal:close()
            return
        end

        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
    end, { noremap = true, silent = true })

    vim.api.nvim_create_autocmd("TermOpen", {
        pattern = "term://*",
        callback = function()
            vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { buffer = 0 })
        end,
    })
end

return module
