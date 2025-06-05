return {
    "lewis6991/gitsigns.nvim",
    
    event = "BufReadPre",
    dependencies = { "petertriho/nvim-scrollbar" },

    config = function()
        require("gitsigns").setup()
        require("scrollbar.handlers.gitsigns").setup()
    end
}
