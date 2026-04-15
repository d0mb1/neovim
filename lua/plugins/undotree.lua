require("undotree").setup({
  position = "right",
})

vim.keymap.set("n", "<leader>u", "<cmd>lua require('undotree').toggle()<cr>", { desc = "Open Undotree" })
