vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/williamboman/mason.nvim",
  "https://github.com/williamboman/mason-lspconfig.nvim",
  "https://github.com/zbirenbaum/copilot.lua",
  "https://github.com/saghen/blink.cmp",
})

require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "zls", "vtsls" },
  automatic_enable = true,
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

-- AI MADE THIS
local function start_lsp(buf)
  local ft = vim.bo[buf].filetype
  local servers = {
    lua = "lua_ls",
    zig = "zls",
    typescript = "vtsls",
    javascript = "vtsls",
    typescriptreact = "vtsls",
    javascriptreact = "vtsls",
    markdown = "markdown-oxide",
  }
  local server = servers[ft]
  if not server then
    return
  end
  local ok, server_obj = pcall(require("mason-lspconfig").get_server, server)
  if ok then
    local clients = vim.lsp.get_clients({ bufnr = buf })
    for _, c in ipairs(clients) do
      if c.name == server then
        return
      end
    end
    vim.lsp.start({
      name = server,
      cmd = server_obj.cmd,
    }, { buffer = buf })
  end
end

vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function(args)
    start_lsp(args.buf)
  end,
})
-- AI MADE THIS

vim.keymap.set("n", "glR", vim.lsp.buf.references, { desc = "References" })
vim.keymap.set("n", "gln", vim.lsp.buf.rename, { desc = "Rename" })
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
