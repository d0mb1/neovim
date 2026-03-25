vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/williamboman/mason.nvim",
  "https://github.com/williamboman/mason-lspconfig.nvim",
  "https://github.com/zbirenbaum/copilot.lua",
  "https://github.com/fang2hou/blink-copilot",
  "https://github.com/saghen/blink.cmp",
  "https://github.com/folke/lazydev.nvim",
})

require("lazydev").setup({
  library = {
    -- See the configuration section for more details
    -- Load luvit types when the `vim.uv` word is found
    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
  },
})

require("copilot").setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
  filetypes = {
    markdown = true,
    help = true,
  },
})

require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "zls", "vtsls" },
  automatic_enable = true,
})

require("blink.cmp").setup({
  keymap = {
    preset = "default",
    ["<C-l>"] = { "show", "show_documentation", "hide_documentation" },
  },
  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = "mono",
  },
  sources = {
    default = { "lazydev", "copilot", "lsp", "path", "snippets", "buffer" },
    providers = {
      copilot = {
        name = "copilot",
        module = "blink-copilot",
        score_offset = 100,
        async = true,
      },
      lazydev = {
        name = "LazyDev",
        module = "lazydev.integrations.blink",
        -- make lazydev completions top priority (see `:h blink.cmp`)
        score_offset = 100,
      },
    },
  },
  signature = { enabled = true },
  snippets = { preset = "default" }, --  | "luasnip" | "mini_snippets" | "vsnip"

  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 1,
    },
  },
})

local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

vim.lsp.config("zls", {
  capabilities = capabilities,
})

vim.lsp.config("markdown-oxide", {
  capabilities = capabilities,
})

vim.lsp.config("vtsls", {
  capabilities = capabilities,
})

vim.keymap.set("n", "glr", vim.lsp.buf.references, { desc = "References" })
vim.keymap.set("n", "gln", vim.lsp.buf.references, { desc = "Rename" })
vim.keymap.set("n", "glt", vim.lsp.buf.type_definition, { desc = "Type Definition" })
vim.keymap.set("n", "gli", vim.lsp.buf.implementation, { desc = "Implementation" })
vim.keymap.set("n", "gla", vim.lsp.buf.code_action, { desc = "Code Actions" })
vim.keymap.set("n", "gld", vim.diagnostic.open_float, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>th", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Inlay Hints" })
-- vim.api.nvim_create_autocmd("LspAttach", {
--   desc = "LSP actions",
--   <LeftMouse>allback = function(event)
--     local function opts(desc)
--       return { buffer = event.buf, remap = false, desc = desc }
--     end
--     vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
--   end,
-- })
