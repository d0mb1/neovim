require("mason").setup()

local capabilities = require("blink.cmp").get_lsp_capabilities()

require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "zls", "vtsls" },
  handlers = {
    function(server)
      vim.lsp.config(server, {
        capabilities = capabilities,
      })
      vim.lsp.enable(server)
    end,
  },
})

vim.lsp.config("lua_ls", { capabilities = capabilities })
vim.lsp.config("zls", { capabilities = capabilities })
vim.lsp.config("vtsls", { capabilities = capabilities })

vim.lsp.enable({ "lua_ls", "zls", "vtsls" })
