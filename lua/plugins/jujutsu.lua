vim.pack.add({ "https://github.com/yannvanhalewyn/jujutsu.nvim" })

require("jujutsu-nvim").setup({
  help_position = "center",
  diff_preset = "diffview",
  keymap = {
    -- Structured format (recommended)
    q = { cmd = "quit", desc = "Close window" },
    R = { cmd = "refresh", desc = "Refresh log" },
    d = { cmd = "describe", desc = "Edit description" },

    -- Map to custom functions
    ["<C-d>"] = {
      cmd = function()
        local jj = require("jujutsu-nvim")
        jj.with_change_at_cursor(function(change_id)
          vim.notify("Custom diff command: " .. change_id)
        end)
      end,
      desc = "Custom diff",
    },
  },
})
