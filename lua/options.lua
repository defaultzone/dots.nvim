vim.g.mapleader      = " "
vim.g.maplocalleader = "\\"

vim.o.mousemoveevent = true

vim.opt.backup      = false
vim.opt.writebackup = false
vim.opt.swapfile    = false

vim.opt.wrap       = false
vim.opt.smartcase  = true
vim.opt.ignorecase = true

vim.opt.tabstop     = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth  = 4
vim.opt.breakindent = true
vim.opt.smartindent = true
vim.opt.expandtab   = true
vim.opt.autoindent  = true

vim.opt.cursorline    = true
vim.opt.termguicolors = true
vim.opt.number        = true
vim.opt.guicursor     = "a:block"
vim.opt.cursorlineopt = "number"
vim.opt.ruler         = false
vim.opt.fillchars     = "eob: ,vert: "
vim.opt.signcolumn    = "yes:1"

vim.opt.clipboard:append({ "unnamedplus" })
