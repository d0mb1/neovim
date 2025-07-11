return {
  "neovim/nvim-lspconfig",
  opts = {
    autoformat = false,
    inlay_hints = { enabled = false },
    diagnostics = {
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.HINT] = "",
          [vim.diagnostic.severity.INFO] = "",
        },
        numhl = {
          [vim.diagnostic.severity.WARN] = "WarningMsg",
          [vim.diagnostic.severity.ERROR] = "ErrorMsg",
          [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
          [vim.diagnostic.severity.HINT] = "DiagnosticHint",
        },
      },
    },
  },
}
