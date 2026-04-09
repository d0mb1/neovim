vim.pack.add({
  "https://github.com/akinsho/bufferline.nvim",
  "https://github.com/catppuccin/nvim",
})

local mocha = require("catppuccin.palettes").get_palette("mocha")

require("bufferline").setup({
  options = {
    diagnostics = "nvim_lsp",
    -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
    --   local icon = level:match("error") and " " or " "
    --   return " " .. icon .. count
    -- end,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and "  " or (e == "warning" and "  " or "  ")
        s = s .. sym .. n
      end
      return s
    end,
  },
  highlights = require("catppuccin.special.bufferline").get_theme({
    styles = { "bold" },
    custom = {
      all = {
        fill = { bg = "#000000" },
      },
      mocha = {
        background = { fg = mocha.text },
      },
      latte = {
        background = { fg = "#000000" },
      },
    },
  }),
})
