require("render-markdown").setup({
  file_types = { "markdown", "sidekick_terminal", "vimwiki" },
  completions = { lsp = { enabled = true } },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "nvim-pack", "help" },
  callback = function(args)
    if string.find(args.file or "", "pack") then
      vim.bo.filetype = "markdown"
    end
  end,
})

vim.keymap.set("n", "<leader>mt", function()
  local rm = require("render-markdown")
  local enabled = require("render-markdown.state").enabled
  if enabled then
    rm.disable()
  else
    rm.enable()
  end
end, { desc = "Toggle Render" })

-- Markdown preview
vim.keymap.set("n", "<leader>mp", function()
  vim.fn["mkdp#util#install"]()
  vim.cmd("MarkdownPreviewToggle")
end, { desc = "Preview" })
