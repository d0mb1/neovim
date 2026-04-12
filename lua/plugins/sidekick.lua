vim.pack.add({
  "https://github.com/folke/sidekick.nvim",
  -- "https://github.com/zbirenbaum/copilot.lua",
})

require("sidekick").setup({
  cli = {
    win = {
      split = {
        width = 130,
      },
    },
  },
})

-- Focus the Sidekick CLI panel (popup window)
vim.keymap.set({ "n", "t", "i", "x" }, "<c-.>", function()
  require("sidekick.cli").focus()
end, { desc = "Sidekick Focus" })

-- Smart jump: goto next edit suggestion, or apply it if no jump available
vim.keymap.set("n", "<tab>", function()
  if not require("sidekick").nes_jump_or_apply() then
    return "<Tab>"
  end
end, { desc = "Goto/Apply Next Edit Suggestion" })

-- Toggle CLI visibility (show/hide panel)
vim.keymap.set("n", "<leader>aa", function()
  require("sidekick.cli").toggle()
end, { desc = "Sidekick Toggle CLI" })

-- Open CLI picker to select/switch between available CLIs
vim.keymap.set("n", "<leader>as", function()
  require("sidekick.cli").select()
end, { desc = "Select CLI" })

-- Detach and close the current CLI session
vim.keymap.set("n", "<leader>ad", function()
  require("sidekick.cli").close()
end, { desc = "Detach a CLI Session" })

-- Send the word/text under cursor to the active CLI
-- {this} is a Sidekick placeholder that expands to current text/word
vim.keymap.set({ "n", "x" }, "<leader>at", function()
  require("sidekick.cli").send({ msg = "{this}" })
end, { desc = "Send This" })

-- Send the entire current file content to the active CLI
-- {file} is a Sidekick placeholder that expands to file contents
vim.keymap.set("n", "<leader>af", function()
  require("sidekick.cli").send({ msg = "{file}" })
end, { desc = "Send File" })

-- Send the visual selection to the active CLI
-- {selection} is a Sidekick placeholder that expands to selected text
vim.keymap.set("x", "<leader>av", function()
  require("sidekick.cli").send({ msg = "{selection}" })
end, { desc = "Send Visual Selection" })

-- Open input prompt to send custom message to the active CLI
vim.keymap.set({ "n", "x" }, "<leader>ap", function()
  require("sidekick.cli").prompt()
end, { desc = "Sidekick Select Prompt" })

-- Toggle Claude CLI specifically and focus its panel
vim.keymap.set("n", "<leader>ac", function()
  require("sidekick.cli").toggle({ name = "claude", focus = true })
end, { desc = "Sidekick Toggle Claude" })
