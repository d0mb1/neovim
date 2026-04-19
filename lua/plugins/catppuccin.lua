require("catppuccin").setup({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  background = { -- :h background
    light = "latte",
    dark = "mocha",
  },
  transparent_background = false, -- disables setting the background color.
  float = {
    transparent = false, -- enable transparent floating windows
    solid = false, -- use solid styling for floating windows, see |winborder|
  },
  term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
  dim_inactive = {
    enabled = false, -- dims the background color of inactive window
    shade = "dark",
    percentage = 0.15, -- percentage of the shade to apply to the inactive window
  },
  no_italic = false, -- Force no italic
  no_bold = false, -- Force no bold
  no_underline = false, -- Force no underline
  styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
    comments = { "italic" }, -- Change the style of comments
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
    -- miscs = {}, -- Uncomment to turn off hard-coded styles
  },
  lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
    virtual_text = {
      errors = {},
      hints = {},
      warnings = {},
      information = {},
      ok = {},
    },
    underlines = {
      errors = { "underline" },
      hints = { "underline" },
      warnings = { "underline" },
      information = { "underline" },
      ok = { "underline" },
    },
    inlay_hints = {
      background = true,
    },
  },
  color_overrides = {},
  highlight_overrides = {
    mocha = function(mocha)
      return {
        -- 1. KEYWORDS (Peach + Bold)
        Keyword = { fg = mocha.peach, style = { "bold" } },
        ["@keyword"] = { link = "Keyword" },
        ["@keyword.function"] = { link = "Keyword" }, -- 'fn', 'function', 'def'
        ["@keyword.return"] = { link = "Keyword" },
        ["@keyword.operator"] = { link = "Keyword" }, -- 'and', 'or', 'not' in some languages
        ["@keyword.import"] = { link = "Keyword" }, -- 'import', 'from'
        ["@keyword.conditional"] = { link = "Keyword" },
        ["@keyword.repeat"] = { link = "Keyword" },
        ["@keyword.exception"] = { link = "Keyword" },
        ["@keyword.directive"] = { link = "Keyword" }, -- #define, #include
        Conditional = { link = "Keyword" },
        Repeat = { link = "Keyword" },
        Include = { link = "Keyword" },
        PreProc = { link = "Keyword" }, -- Preprocessor stuff in C/C++
        Statement = { link = "Keyword" },

        -- 2. STRINGS (Green)
        String = { fg = mocha.green },
        ["@string"] = { link = "String" },
        ["@string.regex"] = { link = "String" },
        ["@string.escape"] = { fg = mocha.teal, style = { "bold" } }, -- Escape chars like \n
        ["@string.special"] = { fg = mocha.teal, style = { "bold" } }, -- Escape chars like \n
        ["@lsp.type.escapeSequence"] = { fg = mocha.teal, style = { "bold" } },
        ["@lsp.type.escapeSequence.zig"] = { fg = mocha.teal, style = { "bold" } },
        -- ["@string.escape.zig"] = { fg = mocha.mauve },
        Character = { link = "String" },
        ["@character"] = { link = "String" },

        -- 3. FUNCTIONS (Blue)
        Function = { fg = mocha.blue },
        ["@function"] = { link = "Function" },
        ["@function.builtin"] = { link = "Function" }, -- print, len, etc.
        ["@function.call"] = { link = "Function" },
        ["@function.method"] = { link = "Function" },
        ["@method"] = { link = "Function" },
        ["@constructor"] = { link = "Function" },

        -- 4. EVERYTHING ELSE (White / mocha.text)
        Number = { fg = mocha.text },
        ["@number"] = { link = "Number" },
        ["@float"] = { link = "Number" },

        Boolean = { fg = mocha.text },
        ["@boolean"] = { link = "Boolean" },

        Type = { fg = mocha.rosewater },
        ["@type"] = { link = "Type" },
        ["@type.builtin"] = { link = "Type" },
        ["@type.definition"] = { link = "Type" },

        Operator = { fg = mocha.text },
        ["@operator"] = { link = "Operator" },

        Identifier = { fg = mocha.text },
        ["@variable"] = { fg = mocha.text },
        ["@variable.builtin"] = { fg = mocha.text }, -- 'self', 'this'
        ["@variable.parameter"] = { fg = mocha.text },
        ["@variable.member"] = { fg = mocha.text }, -- object fields
        ["@property"] = { fg = mocha.text },
        ["@field"] = { fg = mocha.text },
        ["@parameter"] = { fg = mocha.text },

        Constant = { fg = mocha.text }, -- Final variables / CONSTANTS
        ["@constant"] = { link = "Constant" },
        ["@constant.builtin"] = { link = "Constant" },
        ["@constant.macro"] = { link = "Constant" },

        Delimiter = { fg = mocha.text },
        ["@punctuation.bracket"] = { fg = mocha.text },
        ["@punctuation.delimiter"] = { fg = mocha.text },
        ["@punctuation.special"] = { fg = mocha.text },

        ["@tag"] = { fg = mocha.text }, -- HTML/XML tags
        ["@tag.attribute"] = { fg = mocha.text },
        ["@tag.delimiter"] = { fg = mocha.text },

        -- Special case: Labels and Symbols
        Label = { fg = mocha.text },
        ["@label"] = { fg = mocha.text },
        ["@symbol"] = { fg = mocha.text },
        ["@namespace"] = { fg = mocha.text },
        ["@module"] = { fg = mocha.text },

        Comment = { fg = mocha.overlay0 },
        ["@lsp.type.enumMember"] = { fg = mocha.text },
      }
    end,
  },
  custom_highlights = {},
  default_integrations = true,
  auto_integrations = false,
  integrations = {
    blink_cmp = {
      style = "bordered",
    },
    gitsigns = true,
    notify = false,
    render_markdown = true,
    mason = true,
    snacks = {
      enabled = true,
      indent_scope_color = "pink", -- catppuccin color (eg. `lavender`) Default: overlay2
    },
    mini = {
      enabled = true,
      indentscope_color = "",
    },
    -- lualine = true,
  },
})

vim.cmd.colorscheme("catppuccin")
