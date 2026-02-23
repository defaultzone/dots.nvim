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

local utils = require("utils")
local constants = require("config.constants")

for _, command in ipairs(constants.dependencies) do
    if not utils.is_command_available(command) then
        utils.exit_with_message(command .. " command is not available. the current neovim\n" ..
                                "configuration depends on the " .. command .. " package")
    end
end

require("config.options").init()
-- require("config.keymap").init()
require("config.lazy"):init()
