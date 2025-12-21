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

    vim.api.nvim_create_autocmd("FileType", {
        pattern = "*",
        callback = function()
            local excluded_filetypes = { "NvimTree", "TelescopePrompt", "alpha", "help", "man", "qf" }
            local excluded_buftypes = { "nofile", "terminal", "quickfix", "prompt" }

            if not vim.tbl_contains(excluded_filetypes, vim.bo.filetype) and
               not vim.tbl_contains(excluded_buftypes, vim.bo.buftype)
            then
                vim.opt_local.statuscolumn = "%=%{v:relnum != 0 ? v:relnum . ' ' : ''}%l %s%C"
            end
        end,
    })
end

return module
