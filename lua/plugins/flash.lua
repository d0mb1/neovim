require("flash").setup({
  mode = "fuzzy",
  modes = {
    treesitter = {
      labels = "",
      jump = { pos = "range", autojump = true },
      search = { incremental = false },
      label = { before = true, after = true, style = "inline" },
      highlight = {
        backdrop = false,
        matches = false,
      },
    },
  },
})

-- require("flash").treesitter({})

vim.keymap.set({ "n", "x", "o" }, "s", function()
  require("flash").jump()
end, { desc = "Flash" })

vim.keymap.set({ "n", "x", "o" }, "S", function()
  require("flash").treesitter()
end, { desc = "Flash Treesitter" })

vim.keymap.set({ "o" }, "r", function()
  require("flash").remote()
end, { desc = "Remote Flash" })

vim.keymap.set({ "o", "x" }, "R", function()
  require("flash").treesitter_search()
end, { desc = "Treesitter Search" })

vim.keymap.set({ "c" }, "<c-s>", function()
  require("flash").toggle()
end, { desc = "Toggle Flash Search" })

vim.keymap.set({ "n", "x", "o" }, "<cr>", function()
  require("flash").treesitter({
    actions = {
      ["<cr>"] = "next",
      ["<bs>"] = "prev",
    },
  })
end, { desc = "Treesitter incremental selection" })
