-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("t", "jk", "<c-\\><c-n>")
vim.keymap.set("n", "<leader>e", ":lua MiniFiles.open()<CR>", { desc = "Open Files" })
vim.keymap.set("n", "<Leader>cp", "<cmd>CccPick<CR>", { desc = "Color Picker" })
vim.keymap.set("n", "<Leader>U", "<cmd>UndotreeToggle<CR>", { desc = "Undo Tree"})
