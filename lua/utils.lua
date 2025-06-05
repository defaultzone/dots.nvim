local utils = {}

--- Check that passed command is actually available
--- on the system and so can be later used.
---
--- @param command string
--- @return boolean
function utils.is_command_available(command)
    return vim.fn.system(string.format("%s --version 2>/dev/null", command)) ~= ""
end

--- Split string by the lines and get array of the strings.
--- 
--- @param text string
--- @return string[]
function utils.split_by_lines(text)
    local lines = {}

    for line in string.gmatch(text, "[^\n]+") do
        table.insert(lines, line)
    end

    return lines
end

--- Exits neovim with the passed error message. After all messages,
--- user will be suggested to press any key to exit and then neovim
--- will be terminated with `EXIT_FAILURE` status code.
---
--- @param message string
function utils.exit_with_message(message)
    local lines = utils.split_by_lines(message)
    local messages = {}

    for index, line in ipairs(lines) do
        messages[index] = { line .. "\n", "ErrorMsg" }
    end

    table.insert(messages, { "press any key to exit..." })
    vim.api.nvim_echo(messages, true, {})
    vim.fn.getchar()

    os.exit(1)
end

return utils
