require("tiny-inline-diagnostic").setup({
  preset = "powerline",
  options = {
    multilines = {
      enabled = true, -- Enable support for multiline diagnostic messages
      always_show = true, -- Always show messages on all lines of multiline diagnostics
    },
    show_all_diags_on_cursorline = true,
    override_open_float = true,
  },
})

vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
