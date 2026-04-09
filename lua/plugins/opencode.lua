-- OpenCode Neovim Plugin Configuration
-- Adds AI-powered code assistance to Neovim

vim.pack.add({ "https://github.com/nickjvandyke/opencode.nvim" })

require("opencode")

vim.o.autoread = true -- Required for `opts.events.reload`

-- Primary keymaps
vim.keymap.set({ "n", "x" }, "<leader>as", function()
  require("opencode").ask("@this: ", { submit = true })
end, { desc = "Ask opencode…" })

vim.keymap.set({ "n", "x" }, "<leader>aa", function()
  require("opencode").select()
end, { desc = "Execute opencode action…" })

vim.keymap.set("n", "<leader>at", function()
  require("opencode").toggle()
end, { desc = "Toggle opencode" })

-- Motion operators for adding content to opencode context
-- "go" in visual mode adds selected range, "goo" adds current line
vim.keymap.set({ "n", "x" }, "go", function()
  return require("opencode").operator("@this ")
end, { desc = "Add range to opencode", expr = true })

vim.keymap.set("n", "goo", function()
  return require("opencode").operator("@this ") .. "_"
end, { desc = "Add line to opencode", expr = true })

-- Navigation keymaps for scrolling through opencode output
vim.keymap.set("n", "<S-C-u>", function()
  require("opencode").command("session.half.page.up")
end, { desc = "Scroll opencode up" })

vim.keymap.set("n", "<S-C-d>", function()
  require("opencode").command("session.half.page.down")
end, { desc = "Scroll opencode down" })

-- Restore default increment/decrement behavior
-- These are remapped because <C-a> and <C-x> are used for opencode
vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })
