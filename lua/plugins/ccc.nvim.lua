return {
  "uga-rosa/ccc.nvim",
  config = function()
    -- require("ccc").setup({
    --   highlighter = {
    --     auto_enable = true,
    --     lsp = true,
    --   },
    -- })
    local ccc = require("ccc")
    local mapping = ccc.mapping
    ccc.setup({
      highlighter = {
        auto_enable = false,
        lsp = true,
      },
      outputs = {
        ccc.output.hex,
      },
      inputs = {
        ccc.input.hsl,
      },
    })
  end,
}
