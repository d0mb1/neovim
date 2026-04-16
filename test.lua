local function open_tab_with_filenames()
  vim.cmd('enew')
  vim.bo.bufhidden = 'wipe'
  vim.bo.buftype = 'nofile'
  vim.bo.autocomplete = false

  local function refresh()
    local cwd = vim.fn.getcwd()
    local handle = io.popen('ls -a "' .. cwd .. '"')
    local result = handle:read("*a")
    handle:close()
    local lines = vim.split(result, "\n")
    local bufnr = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
  end

  refresh()

  vim.keymap.set("n", "<BS>", function()
    vim.cmd('cd ..')
    refresh()
  end, { buffer = true })

  vim.keymap.set("n", "<CR>", function()
    local curr = vim.fn.getline(".")
    if curr == "." or curr == ".." then
      return
    end
    if vim.fn.isdirectory(curr) == 1 then
      vim.cmd('cd ' .. curr)
      refresh()
    else
      vim.cmd('edit ' .. curr)
    end
  end, { buffer = true })
end

vim.keymap.set("n", "<leader>xc", function()
  open_tab_with_filenames()
end, { desc = "test" })

