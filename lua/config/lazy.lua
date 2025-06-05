local module = {}

module.lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
module.configuration = { ui = { border = "rounded" } }

function module:setup()
    local constants = require("config.constants")
    local utils = require("utils")

    --- @diagnostic disable-next-line (undefined field `fs_stat`)
    if not (vim.uv or vim.loop).fs_stat(self.lazypath) then
        local lazyrepo = "https://github.com/folke/lazy.nvim.git"
        local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, self.lazypath })
        if vim.v.shell_error ~= 0 then
            utils.exit_with_message("failed to clone lazy.nvim:\n" .. out)
        end
    end

    vim.opt.rtp:prepend(self.lazypath)

    require("lazy").setup(constants.plugins_directory, self.configuration)
end

return module
