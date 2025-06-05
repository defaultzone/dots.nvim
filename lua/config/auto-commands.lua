local module = {}

function module.setup()
    local constants = require("config.constants")

    if not constants.enable_tree_on_enter then
        return
    end

    vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
            require("nvim-tree.api").tree.open()
            vim.schedule(function()
                vim.cmd("wincmd p")
            end)
        end
    })
end

return module
