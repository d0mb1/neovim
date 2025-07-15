return {
  {
    "saghen/blink.compat",
    version = "*",
    lazy = true, -- Automatically loads when required by blink.cmp
    opts = {},
  },
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        ["<C-s>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide", "fallback" },

        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        ["<CR>"] = { "accept", "fallback" },

        ["<C-u>"] = { "scroll_documentation_up", "fallback" },
        ["<C-d>"] = { "scroll_documentation_down", "fallback" },
      },
      sources = {
        -- adding any nvim-cmp sources here will enable them
        -- with blink.compat
        compat = {},
        default = { "nvim-px-to-rem", "lsp", "path", "snippets", "buffer", "html-css" },
        providers = {
          ["nvim-px-to-rem"] = {
            module = "nvim-px-to-rem.integrations.blink",
            name = "nvim-px-to-rem",
          },
          ["html-css"] = {
            name = "html-css",
            module = "blink.compat.source",
          },
          -- other providers
          -- …
        },
        -- default = { "omni" },
      },
      completion = {
        list = {
          selection = { preselect = false, auto_insert = true },
        },
        menu = {
          border = "rounded",
        },
        ghost_text = { enabled = false },
        documentation = {
          window = {
            border = "rounded",
          },
        },
      },
      signature = {
        window = {
          border = "rounded",
        },
      },
    },
  },
}
