require("conform").setup({
  notify_on_error = true,
  format_on_save = function(bufnr)
    local disable_filetypes = { c = true, cpp = true }
    if disable_filetypes[vim.bo[bufnr].filetype] then
      return nil
    else
      return {
        timeout_ms = 500,
        lsp_format = "fallback",
      }
    end
  end,
  formatters_by_ft = {
    lua = { "stylua" },
    ts = { "prettierd" },
    css = { "prettierd" },
    scss = { "prettierd" },
    html = { "prettierd" },
  },
})

vim.keymap.set("n", "<leader>lf", function()
  require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Code Format" })
