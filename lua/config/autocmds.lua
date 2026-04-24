Config.new_autocmd({ "FocusGained", "TermClose", "TermLeave" }, "*", function()
  if vim.o.buftype ~= "nofile" then
    vim.cmd("checktime")
  end
end, "checktime")

Config.new_autocmd("VimResized", "*", function()
  local current_tab = vim.fn.tabpagenr()
  vim.cmd("tabdo wincmd =")
  vim.cmd("tabnext " .. current_tab)
end, "resize splits")

Config.new_autocmd("FileType", "man", function(event)
  vim.bo[event.buf].buflisted = false
end, "unlist man files")

Config.new_autocmd("FileType", {
  "plenarytestpopup",
  "checkhealth",
  "dbout",
  "gitsigns-blame",
  "nvim-pack",
  "grug-far",
  "help",
  "nvim-undotree",
  "lspinfo",
  "neotest-output",
  "neotest-output-panel",
  "neotest-summary",
  "notify",
  "qf",
  "spectre_panel",
  "startuptime",
  "tsplayground",
}, function(event)
  vim.bo[event.buf].buflisted = false
  vim.schedule(function()
    vim.keymap.set("n", "q", function()
      vim.cmd("close")
      pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
    end, {
      buffer = event.buf,
      silent = true,
      desc = "quit buffer",
    })
  end)
end, "close with q")

Config.new_autocmd("FileType", { "text", "plaintex", "typst", "gitcommit", "markdown" }, function()
  vim.opt_local.wrap = true
  vim.opt_local.spell = true
end, "wrap and spell")

-- Config.new_autocmd("BufWritePre", "*", function(event)
--   if event.match:match("^%w%w+:[\\/][\\/]") then
--     return
--   end
--   local file = vim.uv.fs_realpath(event.match) or event.match
--   vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
-- end, "auto create dir")

Config.new_autocmd({ "BufRead", "BufNewFile" }, { "*.env", ".env.*" }, function()
  vim.opt_local.filetype = "sh"
end, "env filetype")

Config.new_autocmd({ "BufRead", "BufNewFile" }, { "*.toml*" }, function()
  vim.opt_local.filetype = "toml"
end, "toml filetype")

Config.new_autocmd({ "BufRead", "BufNewFile" }, { "*.ejs", "*.ejs.t" }, function()
  vim.opt_local.filetype = "embedded_template"
end, "ejs filetype")

Config.new_autocmd({ "BufRead", "BufNewFile" }, { "*.code-snippets" }, function()
  vim.opt_local.filetype = "json"
end, "code-snippets filetype")

Config.new_autocmd("BufReadPost", "*", function(event)
  local mark = vim.api.nvim_buf_get_mark(event.buf, '"')
  local lcount = vim.api.nvim_buf_line_count(event.buf)
  if mark[1] > 0 and mark[1] <= lcount then
    pcall(vim.api.nvim_win_set_cursor, 0, mark)
  end
end, "go to last loc")

Config.new_autocmd("BufWinEnter", "*.txt", function()
  if vim.bo.buftype == "help" then
    vim.cmd("wincmd L")
  end
end, "help on left split")
