# defaultzone/dots.nvim

![image](https://github.com/user-attachments/assets/d406bb25-8829-4227-b011-336a2b60e6eb)

### Installation

> Install requires Neovim 0.9+. Always review the code before installing a configuration.

Create the `~/.config/nvim/` directory if it has not been created earlier:
```bash
mkdir -p ~/.confg/nvim
```

Clone the repository and install plugins:
```bash
git clone https://github.com/defaultzone/dots.nvim.git ~/.config/nvim/
```

### Code Structure

- `init.lua`: file that just loads `lua/options.lua` and `lua/config/lazy.lua`.
- `lua/options.lua`: contains neovim options (`vim.opt`, `vim.o`, `vim.g`).
- `lua/config/env.lua`: contains a list of the LSP servers and tools for the languages.
- `lua/config/servers.lua`: contains settings for the LSP servers (currently only for the `lua_ls` server).
- `lua/config/lazy.lua`: bootstrap for the `lazy.nvim` plugin manager.
- `lua/config/plugins.lua`: contains a list of the plugins that will be loaded for `lazy.vim`.
- `lua/config/plugins/`: contains all plugins settings (each file is loaded in `lua/config/plugins.lua`).

### Plugins

- [`windwp/nvim-autopairs`](https://github.com/windwp/nvim-autopairs);
- [`akinsho/bufferline.nvim`](https://github.com/akinsho/bufferline.nvim), dependencies:
    - [`nvim-tree/nvim-web-devicons`](https://github.com/nvim-tree/nvim-web-devicons);
- [`catpuccin/neovim`](https://github.com/akinsho/bufferline.nvim);
- [`numToStr/Comment.nvim`](https://github.com/numToStr/Comment.nvim);
- [`soulis-1256/eagle.nvim`](https://github.com/soulis-1256/eagle.nvim);
- [`lewis6991/gitsigns.nvim`](https://github.com/lewis6991/gitsigns.nvim);
- [`VidocqH/lsp-lens.nvim`](https://github.com/VidocqH/lsp-lens.nvim);
- [`~whynothugo/lsp_lines.nvim`](https://git.sr.ht/~whynothugo/lsp_lines.nvim);
- [`ray-x/lsp_signature.nvim`](https://github.com/ray-x/lsp_signature.nvim);
- [`onsails/lspkind.nvim`](https://github.com/onsails/lspkind.nvim);
- [`nvim-lualine/lualine.nvim`](https://github.com/nvim-lualine/lualine.nvim);
- [`L3MON4D3/LuaSnip`](https://github.com/L3MON4D3/LuaSnip), dependencies:
    - [`rafamadriz/friendly-snippets`](https://github.com/rafamadriz/friendly-snippets);
- [`williamboman/mason.nvim`](https://github.com/williamboman/mason.nvim), dependencies:
    - [`williamboman/mason-lspconfig.nvim`](https://williamboman/mason-lspconfig.nvim)
    - [`WhoIsSethDaniel/mason-tool-installer.nvim`](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim);
- [`hrsh7th/nvim-cmp`](https://github.com/hrsh7th/nvim-cmp), dependencies:
    - [`hrsh7th/cmp-buffer`](https://github.com/hrsh7th/cmp-buffer);
    - [`hrsh7th/cmp-path`](https://github.com/hrsh7th/cmp-path);
    - [`hrsh7th/cmp-cmdline`](https://github.com/hrsh7th/cmp-cmdline);
    - [`hrsh7th/cmp-nvim-lsp`](https://github.com/hrsh7th/cmp-nvim-lsp);
- [`neovim/nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig), dependencies:
    - [`folke/neodev.nvim`](https://github.com/folke/neodev.nvim);
- [`petertriho/nvim-scrollbar`](https://github.com/petertriho/nvim-scrollbar);
- [`nvim-tree/nvim-tree.lua`](https://github.com/nvim-tree/nvim-tree.lua), dependencies:
    - [`nvim-tree/nvim-web-devicons`](https://github.com/nvim-tree/nvim-web-devicons);
- [`nvim-treesitter/nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter);
- [`folke/todo-comments.nvim`](https://github.com/folke/todo-comments.nvim), dependencies:
    - [`nvim-lua/plenary.nvim`](https://github.com/nvim-lua/plenary.nvim);

### License

Copyright (C) 2024 defaultzone. Licensed under the GNU General Public License v3 (GPLv3).
