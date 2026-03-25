vim.pack.add({ "https://github.com/akinsho/bufferline.nvim" })

local mocha = require("catppuccin.palettes").get_palette("mocha")
require("bufferline").setup({
  options = {
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " " or (e == "warning" and " " or " ")
        s = s .. n .. sym
      end
      return s
    end,
  },
  highlights = require("catppuccin.special.bufferline").get_theme({
    styles = { "italic", "bold" },
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
