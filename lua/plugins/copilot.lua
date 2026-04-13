vim.pack.add({
  "https://github.com/zbirenbaum/copilot.lua",
  "https://github.com/fang2hou/blink-copilot",
})

require("copilot").setup({
  suggestion = { enabled = true },
  panel = { enabled = false },
  filetypes = {
    markdown = true,
    help = true,
  },
})
