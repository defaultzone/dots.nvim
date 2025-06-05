local utils = require("utils")
local constants = require("config.constants")

for _, command in ipairs(constants.dependencies) do
    if not utils.is_command_available(command) then
        utils.exit_with_message(command .. " command is not available. the current neovim\n" ..
                                "configuration depends on the " .. command .. " package")
    end
end

require("config.options"):setup()
require("config.lazy"):setup()
require("config.auto-commands").setup()
