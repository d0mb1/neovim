require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "zls", "vtsls", "rust_analyzer" },
  handlers = {
    function(server)
      vim.lsp.config(server, {
        capabilities = Config.capabilities,
      })
      vim.lsp.enable(server)
    end,
  },
})

vim.lsp.config("lua_ls", { capabilities = Config.capabilities })
vim.lsp.config("zls", { capabilities = Config.capabilities })
vim.lsp.config("vtsls", { capabilities = Config.capabilities })
vim.lsp.config("rust_analyzer", { capabilities = Config.capabilities })

vim.lsp.enable({ "lua_ls", "zls", "vtsls", "rust_analyzer" })
