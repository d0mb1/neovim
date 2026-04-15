--------------------------------------------------------------------- CATPPUCCIN
-- Catppuccin: Soothing pastel theme for Neovim
-- Provides colorschemes and integrations for various plugins
vim.pack.add({ "https://github.com/catppuccin/nvim" })
require("plugins.catppuccin")

--------------------------------------------------------------------------- MINI
-- Mini.nvim: Collection of minimalistic Neovim plugins
-- Includes mini.bufremove, mini.files, mini.ai, etc.
vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })
require("plugins.mini")

---------------------------------------------------------------------- BLINK.CMP
-- Blink.cmp: Fast, extensible completion plugin for Neovim
-- Blink.compat: Compatibility layer for blink.cmp
-- Blink-copilot: GitHub Copilot integration for blink.cmp
vim.pack.add({
  {
    src = "https://github.com/saghen/blink.cmp",
    version = vim.version.range("*"),
  },
  "https://github.com/saghen/blink.compat",
  "https://github.com/fang2hou/blink-copilot",
})
require("plugins.blink")

------------------------------------------------------------------------ CONFORM
-- Conform.nvim: Lightweight formatting plugin
-- Supports multiple formatters and linters
vim.pack.add({ "https://github.com/stevearc/conform.nvim" })
require("plugins.conform")

---------------------------------------------------------------------------- LSP
-- LSP configuration and language server management
-- nvim-lspconfig: Common LSP configurations
-- Mason.nvim: LSP server installer
-- Mason-lspconfig: Mason + nvim-lspconfig bridge
-- Copilot.lua: GitHub Copilot integration
vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/williamboman/mason.nvim",
  "https://github.com/williamboman/mason-lspconfig.nvim",
  "https://github.com/zbirenbaum/copilot.lua",
})
require("plugins.lsp")

--------------------------------------------------------------------- TREESITTER
-- Nvim-treesitter: Syntax highlighting and parsing
-- Nvim-treesitter-textobjects: textobjects support for treesitter
vim.pack.add({
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    branch = "main",
  },
  "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
})
require("plugins.treesitter")

----------------------------------------------------------------------- SNIPPETS
-- LuaSnip: Snippet engine for Neovim
-- Friendly-snippets: Collection of common snippets
vim.pack.add({
  "https://github.com/L3MON4D3/LuaSnip",
  "https://github.com/rafamadriz/friendly-snippets",
})
require("plugins.snippets")

------------------------------------------------------------------------ LUALINE
-- Lualine.nvim: Status line plugin for Neovim
vim.pack.add({
  "https://github.com/nvim-lualine/lualine.nvim",
  -- "https://github.com/nvim-tree/nvim-web-devicons",
})
require("plugins.lualine")

----------------------------------------------------------------------- MARKDOWN
-- Render-markdown.nvim: Markdown rendering in Neovim
-- Markdown-preview.nvim: Markdown preview in browser
vim.pack.add({
  "https://github.com/MeanderingProgrammer/render-markdown.nvim",
  "https://github.com/iamcco/markdown-preview.nvim",
})
require("plugins.markdown")

----------------------------------------------------------------------- GITSIGNS
-- Gitsigns.nvim: Git integration for Neovim
vim.pack.add({
  "https://github.com/lewis6991/gitsigns.nvim",
})
require("plugins.gitsigns")

------------------------------------------------------------------------- SNACKS
-- Snacks.nvim: Utility plugin for Neovim
-- Provides winbar, statuscolumn, and other UI enhancements
vim.pack.add({
  "https://github.com/folke/snacks.nvim",
})
require("plugins.snacks")

-------------------------------------------------------------------------- FLASH
-- Flash.nvim: Motion search plugin for Neovim
vim.pack.add({ "https://github.com/folke/flash.nvim" })
require("plugins.flash")

--------------------------------------------------------------------- BUFFERLINE
-- Bufferline.nvim: Buffer tabline plugin for Neovim
vim.pack.add({
  "https://github.com/akinsho/bufferline.nvim",
})
require("plugins.bufferline")

---------------------------------------------------------------------------- OIL
-- Oil.nvim: File explorer as buffer for Neovim
vim.pack.add({
  "https://github.com/stevearc/oil.nvim",
})
require("plugins.oil")

------------------------------------------------------------------------ LAZYDEV
-- Lazydev.nvim: Lazy.nvim dev plugin
vim.pack.add({ "https://github.com/folke/lazydev.nvim" })
require("plugins.lazydev")

-------------------------------------------------------------------------- CRISP
-- Crisp.nvim: Cursor line highlighting plugin
vim.pack.add({ "file:///home/dombi/Documents/Lua/crisp.nvim" })
require("plugins.crisp")

----------------------------------------------------------------------- BROCHURE
-- Brochure.nvim: Bufferline-like plugin
vim.pack.add({ "file:///home/dombi/Documents/Lua/brochure.nvim" })
require("plugins.brochure")

----------------------------------------------------------------------- SIDEKICK
-- Sidekick.nvim: Sidebar plugin for Neovim
vim.pack.add({
  "https://github.com/folke/sidekick.nvim",
  -- "https://github.com/zbirenbaum/copilot.lua",
})
require("plugins.sidekick")

----------------------------------------------------------------------- UNDOTREE
vim.pack.add({ "https://github.com/jiaoshijie/undotree" })
require("plugins.undotree")
