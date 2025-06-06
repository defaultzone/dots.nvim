local module = {}

function module.setup()
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set("n", "gt", function() vim.lsp.buf.type_definition() end, opts)
    vim.keymap.set("n", "gs", function() vim.lsp.buf.implementation() end, opts)
end

return module
