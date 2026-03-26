vim.pack.add({
  "https://github.com/zbirenbaum/copilot.lua",
  "https://github.com/fang2hou/blink-copilot",
  "https://github.com/saghen/blink.cmp",
})

require("copilot").setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
  filetypes = {
    markdown = true,
    help = true,
  },
})
