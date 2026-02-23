--- defaultzone/dots.nvim - Neovim Configuration Files
--- Copyright (C) 2026 Dmitry Lyubimcev (defaultzone) <dzone@danwin1210.de>
---
--- This program is free software: you can redistribute it and/or modify
--- it under the terms of the GNU General Public License as published by
--- the Free Software Foundation, either version 3 of the License, or
--- (at your option) any later version.
---
--- This program is distributed in the hope that it will be useful,
--- but WITHOUT ANY WARRANTY; without even the implied warranty of
--- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
--- GNU General Public License for more details.
---
--- You should have received a copy of the GNU General Public License
--- along with this program. If not, see <https://www.gnu.org/licenses/>.

local module = {}

function module.init()
    vim.o.winborder = "rounded"

    vim.g.mapleader = " "
    vim.g.maplocalleader = "\\"
    vim.g.loaded_perl_provider = 0

    vim.opt.backup = false
    vim.opt.writebackup = false
    vim.opt.swapfile = false

    vim.opt.guicursor = "a:block"
    vim.opt.cursorline = true
    vim.opt.termguicolors = true

    vim.opt.ruler = false
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.breakindent = true
    vim.opt.smartindent = true
    vim.opt.expandtab = true
    vim.opt.autoindent = true

    vim.opt.clipboard:append({ "unnamedplus" })
end

return module
