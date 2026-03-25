--- diagnostic settings

vim.diagnostic.config({
  -- keep underline & severity_sort on for quick scanning
  underline = true,
  severity_sort = true,
  update_in_insert = false, -- less flicker

  float = {
    border = "rounded",
    source = true,
    severity_sort = true,
    focusable = true,
  },

  -- keep signs & virtual text, but tune them as you like
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = "󰌵 ",
    },
  },
  virtual_text = {
    priority = 100,
    spacing = 4,
    source = "if_many",
    prefix = " ",
  },
  linehl = {
    [vim.diagnostic.severity.ERROR] = "DiagnosticErrorLine",
  },
})

-- diagnostic keymaps
local diagnostic_goto = function(next, severity)
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    vim.diagnostic.jump({ count = next and 1 or -1, float = true, severity = severity })
  end
end

vim.keymap.set("n", "<leader>tl", function()
  local config = vim.diagnostic.config()
  -- Check if virtual_lines is currently enabled
  local lines_currently_on = config.virtual_lines ~= false

  if lines_currently_on then
    -- SWITCH TO: Virtual Text ON, Virtual Lines OFF
    vim.diagnostic.config({
      virtual_lines = false,
      virtual_text = {
        priority = 100,
        spacing = 4,
        source = "if_many",
        prefix = " ",
      }, -- Or your specific virtual_text config table
    })
    print("Diagnostics: Virtual Text")
  else
    -- SWITCH TO: Virtual Lines ON, Virtual Text OFF
    vim.diagnostic.config({
      virtual_text = false,
      virtual_lines = {
        current_line = true,
        format = function(diagnostic)
          local severity = diagnostic.severity == vim.diagnostic.severity.ERROR and "" or ""
          return string.format("%s  %s", severity, diagnostic.message)
        end,
      },
    })
    print("Diagnostics: Virtual Lines")
  end
end, { desc = "Virtual Lines/Text" })

vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
-- vim.keymap.set("n", "<leader>td", function()
--   vim.diagnostic.enable(not vim.diagnostic.is_enabled())
-- end, { desc = "Toggle Diagnostics" })
vim.keymap.set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
vim.keymap.set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
vim.keymap.set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
vim.keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
vim.keymap.set("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" }) -- NOTE: Might conflict with mini.bracketed
vim.keymap.set("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" }) -- NOTE: Might conflict with mini.bracketed
