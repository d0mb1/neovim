--------------------------------------------------------------------- CATPPUCCIN
-- Catppuccin: Soothing pastel theme for Neovim
-- Provides colorschemes and integrations for various plugins
Config.now(function()
  vim.pack.add({ "https://github.com/catppuccin/nvim" })
  require("plugins.catppuccin")
end)

--------------------------------------------------------------------------- MINI
-- Mini.nvim: Collection of minimalistic Neovim plugins
-- Includes mini.bufremove, mini.files, mini.ai, etc.
Config.now(function()
  vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })
  require("plugins.mini")
end)

---------------------------------------------------------------------- BLINK.CMP
-- Blink.cmp: Fast, extensible completion plugin for Neovim
-- Blink.compat: Compatibility layer for blink.cmp
-- Blink-copilot: GitHub Copilot integration for blink.cmp
Config.on_event("InsertEnter", function()
  vim.pack.add({
    {
      src = "https://github.com/saghen/blink.cmp",
      version = vim.version.range("*"),
    },
    "https://github.com/saghen/blink.compat",
    "https://github.com/fang2hou/blink-copilot",
  })
  require("plugins.blink")
end)

------------------------------------------------------------------------ CONFORM
-- Conform.nvim: Lightweight formatting plugin
-- Supports multiple formatters and linters
Config.later(function()
  vim.pack.add({ "https://github.com/stevearc/conform.nvim" })
  require("plugins.conform")
end)

---------------------------------------------------------------------------- LSP
-- LSP configuration and language server management
-- nvim-lspconfig: Common LSP configurations
-- Mason.nvim: LSP server installer
-- Mason-lspconfig: Mason + nvim-lspconfig bridge
-- Copilot.lua: GitHub Copilot integration
Config.later(function()
  vim.pack.add({
    "https://github.com/saghen/blink.cmp",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/williamboman/mason.nvim",
    "https://github.com/williamboman/mason-lspconfig.nvim",
    "https://github.com/zbirenbaum/copilot.lua",
  })
  require("plugins.lsp")
end)

--------------------------------------------------------------------- TREESITTER
-- Nvim-treesitter: Syntax highlighting and parsing
-- Nvim-treesitter-textobjects: textobjects support for treesitter
Config.later(function()
  vim.pack.add({
    {
      src = "https://github.com/nvim-treesitter/nvim-treesitter",
      branch = "main",
    },
    {
      src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
      branch = "main",
    },
  })
  require("plugins.treesitter")
end)

----------------------------------------------------------------------- SNIPPETS
-- LuaSnip: Snippet engine for Neovim
-- Friendly-snippets: Collection of common snippets
Config.on_event("InsertEnter", function()
  vim.pack.add({
    "https://github.com/L3MON4D3/LuaSnip",
    "https://github.com/rafamadriz/friendly-snippets",
  })
  require("plugins.snippets")
end)

-- ------------------------------------------------------------------------ LUALINE
-- -- Lualine.nvim: Status line plugin for Neovim
-- vim.pack.add({
--   "https://github.com/nvim-lualine/lualine.nvim",
--   -- "https://github.com/nvim-tree/nvim-web-devicons",
-- })
-- require("plugins.lualine")

----------------------------------------------------------------------- MARKDOWN
-- Render-markdown.nvim: Markdown rendering in Neovim
-- Markdown-preview.nvim: Markdown preview in browser
Config.on_filetype("md", function()
  vim.pack.add({
    "https://github.com/MeanderingProgrammer/render-markdown.nvim",
    "https://github.com/iamcco/markdown-preview.nvim",
  })
  require("plugins.markdown")
end)

----------------------------------------------------------------------- GITSIGNS
-- Gitsigns.nvim: Git integration for Neovim
Config.later(function()
  vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })
  require("plugins.gitsigns")
end)

------------------------------------------------------------------------- SNACKS
-- Snacks.nvim: Utility plugin for Neovim
-- Provides winbar, statuscolumn, and other UI enhancements
Config.later(function()
  vim.pack.add({ "https://github.com/folke/snacks.nvim" })
  require("plugins.snacks")
end)

-------------------------------------------------------------------------- FLASH
-- Flash.nvim: Motion search plugin for Neovim
Config.later(function()
  vim.pack.add({ "https://github.com/folke/flash.nvim" })
  require("plugins.flash")
end)

--------------------------------------------------------------------- BUFFERLINE
-- Bufferline.nvim: Buffer tabline plugin for Neovim
Config.now(function()
  vim.pack.add({ "https://github.com/akinsho/bufferline.nvim" })
  require("plugins.bufferline")
end)

---------------------------------------------------------------------------- OIL
-- Oil.nvim: File explorer as buffer for Neovim
Config.later(function()
  vim.pack.add({ "https://github.com/stevearc/oil.nvim" })
  require("plugins.oil")
end)

------------------------------------------------------------------------ LAZYDEV
-- Lazydev.nvim: Lazy.nvim dev plugin
Config.on_filetype("lua", function()
  vim.pack.add({ "https://github.com/folke/lazydev.nvim" })
  require("plugins.lazydev")
end)

----------------------------------------------------------------------- SIDEKICK
-- Sidekick.nvim: Sidebar plugin for Neovim
Config.later(function()
  vim.pack.add({ "https://github.com/folke/sidekick.nvim" })
  require("plugins.sidekick")
end)

----------------------------------------------------------------------- UNDOTREE
Config.later(function()
  vim.pack.add({ "https://github.com/jiaoshijie/undotree" })
  require("plugins.undotree")
end)

--------------------------------------------------------------- TINY DIAGNOSTICS
Config.on_event("LspAttach", function()
  vim.pack.add({ "https://github.com/rachartier/tiny-inline-diagnostic.nvim" })
  require("plugins.tiny-diagnostics")
end)
