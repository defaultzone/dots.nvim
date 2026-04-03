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

local function try_close_toggleterm_terminal()
    local terminal = require("toggleterm.terminal")
    local focused_terminal = terminal.get(terminal.get_focused_id())

    if not focused_terminal then
        return false
    end

    focused_terminal:close()

    return true
end

--- neovim/neovim: gF should recognize more file/line/column patterns and seek to column #32178
--- https://github.com/neovim/neovim/issues/32178#issuecomment-2618847848
local function custom_gf()
    local qf_data = vim.fn.getqflist({
        lines = { vim.fn.getline(".") },
    }).items[1]

    if qf_data and qf_data.valid == 1 then
        vim.cmd.buffer(qf_data.bufnr)
        vim.api.nvim_win_set_cursor(0, { qf_data.lnum, math.max(qf_data.col - 1, 0) })
        return
    end

    vim.cmd("norm! gF")
end

function module.init_neovim_keymap()
    vim.keymap.set("n", "gf", custom_gf)
end

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
        if try_close_toggleterm_terminal() then
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
        end
    end, { noremap = true, silent = true })

    vim.api.nvim_create_autocmd("TermOpen", {
        pattern = "term://*",
        callback = function()
            vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { buffer = 0 })
        end,
    })

    vim.api.nvim_create_augroup("ToggleTerm", {})
    vim.api.nvim_create_autocmd("TermOpen", {
        pattern = "term://*toggleterm#*",
        callback = function()
            vim.keymap.set("n", "gf", function()
                local cursor = vim.api.nvim_win_get_cursor(0)
                local buffer = vim.api.nvim_get_current_buf()

                try_close_toggleterm_terminal()

                vim.api.nvim_win_set_buf(0, buffer)
                vim.api.nvim_win_set_cursor(0, cursor)
                custom_gf()
            end, { buffer = true })
        end,
        group = "ToggleTerm"
    })
end

return module
