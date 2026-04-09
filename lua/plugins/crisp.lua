-- vim.pack.add({ "https://github.com/d0mb1/crisp.nvim" })
vim.pack.add({ "file:///home/dombi/Documents/Lua/crisp.nvim" })

require("crisp")

vim.keymap.set("n", "<leader>ec", ":CrispFiles<CR>")

-- vim.keymap>.set("n", "<leader>ec", require("crisp").open, { desc = "Open file manager" })

vim.keymap.set("n", "<leader>xx", function()
  -- 1. Save the current file
  vim.cmd("write")

  -- 2. Run shell commands: git add and git commit
  -- We use :silent to prevent 'Press ENTER' prompts for every shell command
  vim.cmd("silent !git add .")
  vim.cmd("silent !git commit -m '.'")

  -- 3. Update the specific plugin via the lua API
  -- Note: Ensure 'crisp.nvim' is the correct name used in your plugin manager
  if pcall(require, "vim.pack") then
    vim.api.nvim_command('lua vim.pack.update({"crisp.nvim"})')
  else
    -- Fallback: execute as a direct command string
    vim.cmd('lua vim.pack.update({"crisp.nvim"})')
  end

  vim.cmd("write")
  -- 4. Restart Neovim
  -- This assumes you have a :Restart command defined (e.g., from 'folke/trouble.nvim'
  -- or a custom script). If not, we use :qa followed by a restart logic.
  vim.cmd("restart")
end, { desc = "Git sync, update crisp.nvim, and restart" })
