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

-- AI MADE THIS
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function(args)
    start_lsp(args.buf)
  end,
})
-- AI MADE THIS

vim.keymap.set("n", "gld", vim.diagnostic.open_float, { desc = "Diagnostics" })
