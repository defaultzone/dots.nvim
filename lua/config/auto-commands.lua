local module = {}

function module.setup()
    local constants = require("config.constants")

    if constants.enable_tree_on_enter then
        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
                require("nvim-tree.api").tree.open()
                vim.schedule(function()
                    vim.cmd("wincmd p")
                end)
            end
        })
    end

    if vim.tbl_contains(constants.treesitter_languages, "c3") then
        vim.filetype.add({
            extension = {
                c3 = "c3",
                c3i = "c3",
                c3t = "c3"
            }
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "c3",
            callback = function()
                vim.treesitter.start()
            end
        })
    end
end

return module
