require("blink.cmp").setup({
  keymap = {
    preset = "default",
    ["<C-l>"] = { "show", "show_documentation", "hide_documentation" },
  },
  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = "normal",
  },
  sources = {
    default = {
      "lazydev",
      "lsp",
      -- "copilot",
      "path",
      "snippets",
      "buffer",
    },
    providers = {
      lazydev = {
        name = "LazyDev",
        module = "lazydev.integrations.blink",
        score_offset = 100,
      },
      -- copilot = {
      --   name = "copilot",
      --   module = "blink-copilot",
      --   score_offset = 1,
      --   async = true,
      -- },
    },
  },
  signature = { enabled = true },
  snippets = { preset = "luasnip" }, --  | "luasnip" | "mini_snippets" | "vsnip"

  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 1,
    },
  },
})

require("blink.compat").setup({})
