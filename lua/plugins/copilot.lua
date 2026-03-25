vim.pack.add({
  "https://github.com/zbirenbaum/copilot.lua",
  "https://github.com/fang2hou/blink-copilot",
  "https://github.com/saghen/blink.cmp",
})

require("copilot").setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
  filetypes = {
    markdown = true,
    help = true,
  },
})

require("blink.cmp").setup({
  keymap = {
    preset = "default",
    ["<C-l>"] = { "show", "show_documentation", "hide_documentation" },
  },
  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = "mono",
  },
  sources = {
    default = { "copilot", "lsp", "path", "snippets", "buffer" },
    providers = {
      copilot = {
        name = "copilot",
        module = "blink-copilot",
        score_offset = 100,
        async = true,
      },
    },
  },
  signature = { enabled = true },
  snippets = { preset = "default" }, --  | "luasnip" | "mini_snippets" | "vsnip"

  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 1,
    },
  },
})
