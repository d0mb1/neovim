local palette = require("catppuccin.palettes").get_palette("mocha")

require("bufferline").setup({
  options = {
    diagnostics = "nvim_lsp",

    ---@diagnostic disable-next-line: unused-local
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
      mocha = {
        background = { fg = palette.text },
      },
    },
  }),
})
