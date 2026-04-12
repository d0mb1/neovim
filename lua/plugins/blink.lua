vim.pack.add({
  "https://github.com/fang2hou/blink-copilot",
  "https://github.com/saghen/blink.cmp",
  "https://github.com/Kaiser-Yang/blink-cmp-avante",
  "https://github.com/saghen/blink.compat",
})

-- Completion plugin configuration

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
    default = {
      -- "avante_shortcuts",
      -- "avante_mentions",
      -- "avante_files",
      -- "avante_commands",
      -- "avante",
      "copilot",
      "lazydev",
      "lsp",
      "path",
      "snippets",
      "buffer",
    },
    providers = {
      lazydev = {
        name = "LazyDev",
        module = "lazydev.integrations.blink",
        -- make lazydev completions top priority (see `:h blink.cmp`)
        score_offset = 100,
      },
      copilot = {
        name = "copilot",
        module = "blink-copilot",
        score_offset = 100,
        async = true,
      },
      -- avante = {
      --   module = "blink-cmp-avante",
      --   name = "Avante",
      --   opts = {
      --     -- options for blink-cmp-avante
      --   },
      -- },
      -- avante_commands = {
      --   name = "avante_commands",
      --   module = "blink.compat.source",
      --   score_offset = 90, -- show at a higher priority than lsp
      --   opts = {},
      -- },
      -- avante_files = {
      --   name = "avante_files",
      --   module = "blink.compat.source",
      --   score_offset = 100, -- show at a higher priority than lsp
      --   opts = {},
      -- },
      -- avante_mentions = {
      --   name = "avante_mentions",
      --   module = "blink.compat.source",
      --   score_offset = 1000, -- show at a higher priority than lsp
      --   opts = {},
      -- },
      -- avante_shortcuts = {
      --   name = "avante_shortcuts",
      --   module = "blink.compat.source",
      --   score_offset = 1000, -- show at a higher priority than lsp
      --   opts = {},
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
