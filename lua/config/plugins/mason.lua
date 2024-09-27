return {
    "williamboman/mason.nvim",
    event        = "BufReadPre",
    cmd          = "Mason",
    opts         = { ui = { border = "rounded" } }
}
