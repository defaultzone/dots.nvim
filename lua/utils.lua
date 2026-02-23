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

--- Check that passed command is actually available
--- on the system and so can be later used.
---
--- @param command string
--- @return boolean
function module.is_command_available(command)
    return vim.fn.system(string.format("%s --version 2>/dev/null", command)) ~= ""
end

--- Exits neovim with the passed error message. After all messages,
--- user will be suggested to press any key to exit and then neovim
--- will be terminated with `EXIT_FAILURE` status code.
---
--- @param message string
function module.exit_with_message(message)
    local lines = module.split_by_lines(message)
    local messages = {}

    for index, line in ipairs(lines) do
        messages[index] = { line .. "\n", "ErrorMsg" }
    end

    table.insert(messages, { "press any key to exit..." })
    vim.api.nvim_echo(messages, true, {})
    vim.fn.getchar()

    os.exit(1)
end

return module
