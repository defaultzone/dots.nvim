vim.loader.enable()

require("options")
require("config.lazy")

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        require("nvim-tree.api").tree.open()
        vim.schedule(function()
            vim.cmd("wincmd p")
        end)
    end
})
