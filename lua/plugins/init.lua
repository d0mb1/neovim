local now, now_if_args, later, add = Config.now, Config.now_if_args, Config.later, vim.pack.add

--------------------------------------------------------------------- CATPPUCCIN
-- Catppuccin: Soothing pastel theme for Neovim
-- Provides colorschemes and integrations for various plugins
now(function()
  add({ "https://github.com/catppuccin/nvim" })
  require("plugins.catppuccin")
end)

--------------------------------------------------------------------------- MINI
-- Mini.nvim: Collection of minimalistic Neovim plugins
-- Includes mini.bufremove, mini.files, mini.ai, etc.
now(function()
  add({
    "https://github.com/nvim-mini/mini.nvim",
  })
  require("plugins.mini")
end)

---------------------------------------------------------------------- BLINK.CMP
-- Blink.cmp: Fast, extensible completion plugin for Neovim
-- Blink.compat: Compatibility layer for blink.cmp
-- Blink-copilot: GitHub Copilot integration for blink.cmp
now_if_args(function()
  add({
    {
      src = "https://github.com/saghen/blink.cmp",
      version = vim.version.range("^1"),
    },
    "https://github.com/saghen/blink.compat",
    "https://github.com/fang2hou/blink-copilot",
  })
  require("plugins.blink")
end)

------------------------------------------------------------------------ CONFORM
-- Conform.nvim: Lightweight formatting plugin
-- Supports multiple formatters and linters
later(function()
  add({ "https://github.com/stevearc/conform.nvim" })
  require("plugins.conform")
end)

---------------------------------------------------------------------------- LSP
-- LSP configuration and language server management
-- nvim-lspconfig: Common LSP configurations
-- Mason.nvim: LSP server installer
-- Mason-lspconfig: Mason + nvim-lspconfig bridge
-- Copilot.lua: GitHub Copilot integration
now_if_args(function()
  add({
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
now_if_args(function()
  add({
    {
      src = "https://github.com/nvim-treesitter/nvim-treesitter",
      branch = "main",
    },
    {
      src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
      branch = "main",
    },
  })
  local ts_update = function()
    vim.cmd("TSUpdate")
  end
  Config.on_packchanged("nvim-treesitter", { "update" }, ts_update, ":TSUpdate")
  require("plugins.treesitter")
end)

----------------------------------------------------------------------- SNIPPETS
-- LuaSnip: Snippet engine for Neovim
-- Friendly-snippets: Collection of common snippets
later(function()
  add({
    "https://github.com/L3MON4D3/LuaSnip",
    "https://github.com/rafamadriz/friendly-snippets",
  })
  require("plugins.snippets")
end)

-- ------------------------------------------------------------------------ LUALINE
-- -- Lualine.nvim: Status line plugin for Neovim
-- add({
--   "https://github.com/nvim-lualine/lualine.nvim",
--   -- "https://github.com/nvim-tree/nvim-web-devicons",
-- })
-- require("plugins.lualine")

----------------------------------------------------------------------- MARKDOWN
-- Render-markdown.nvim: Markdown rendering in Neovim
-- Markdown-preview.nvim: Markdown preview in browser
later(function()
  add({
    "https://github.com/MeanderingProgrammer/render-markdown.nvim",
    "https://github.com/iamcco/markdown-preview.nvim",
  })
  require("plugins.markdown")
end)

----------------------------------------------------------------------- GITSIGNS
-- Gitsigns.nvim: Git integration for Neovim
later(function()
  add({ "https://github.com/lewis6991/gitsigns.nvim" })
  -- add({ "https://github.com/sindrets/diffview.nvim" })
  require("plugins.gitsigns")
end)

------------------------------------------------------------------------- SNACKS
-- Snacks.nvim: Utility plugin for Neovim
-- Provides winbar, statuscolumn, and other UI enhancements
now(function()
  add({ "https://github.com/folke/snacks.nvim" })
  require("plugins.snacks")
end)

-------------------------------------------------------------------------- FLASH
-- Flash.nvim: Motion search plugin for Neovim
now_if_args(function()
  add({ "https://github.com/folke/flash.nvim" })
  require("plugins.flash")
end)

-- --------------------------------------------------------------------- BUFFERLINE
-- -- Bufferline.nvim: Buffer tabline plugin for Neovim
-- now(function()
--   add({ "https://github.com/akinsho/bufferline.nvim" })
--   require("plugins.bufferline")
-- end)

---------------------------------------------------------------------------- OIL
-- Oil.nvim: File explorer as buffer for Neovim
later(function()
  add({ "https://github.com/stevearc/oil.nvim" })
  require("plugins.oil")
end)

------------------------------------------------------------------------ LAZYDEV
-- Lazydev.nvim: Lazy.nvim dev plugin
now_if_args(function()
  add({ "https://github.com/folke/lazydev.nvim" })
  require("plugins.lazydev")
end)

----------------------------------------------------------------------- SIDEKICK
-- Sidekick.nvim: Sidebar plugin for Neovim
later(function()
  add({ "https://github.com/folke/sidekick.nvim" })
  require("plugins.sidekick")
end)

----------------------------------------------------------------------- UNDOTREE
-- undo tree plugin for whenever I need to go to whatever iteration of a file
later(function()
  add({ "https://github.com/jiaoshijie/undotree" })
  require("plugins.undotree")
end)

--------------------------------------------------------------- TINY DIAGNOSTICS
-- Nicer diagnostics with line wrapping
later(function()
  add({ "https://github.com/rachartier/tiny-inline-diagnostic.nvim" })
  require("plugins.tiny-diagnostics")
end)

---------------------------------------------------------------------- AUTOPAIRS
-- Better auto-pairing for brackets, quotes etc..
now_if_args(function()
  add({ "https://github.com/windwp/nvim-autopairs" })
  require("plugins.autopairs")
end)
