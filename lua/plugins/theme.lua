-- Define your 4-color Palette
local bg = "#222222" -- Pure Black
local fg = "#FFFFFF" -- Pure White
local keyword = "#9999FF" -- Cyan (Electric)
local string = "#55FF55" -- Yellow (Bright)
local comment = "#707070" -- Mid-Gray (Distinct from white/black)

local function setup_theme()
  -- Reset highlights
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.g.colors_name = "quad-chrome"

  local highlights = {
    -- BASE COLORS (Anything else)
    Normal = { fg = fg, bg = bg },
    NonText = { fg = comment },
    Visual = { bg = "#333333" }, -- subtle selection
    CursorLine = { bg = "#222222" },

    -- THE 4 PILLARS
    Keyword = { fg = keyword, bold = true },
    Statement = { fg = keyword, bold = true },
    Conditional = { fg = keyword, bold = true },
    Repeat = { fg = keyword, bold = true },

    String = { fg = string },
    Number = { fg = string },
    Boolean = { fg = string },
    Character = { fg = string },

    Comment = { fg = comment, italic = true },

    -- EVERYTHING ELSE (Mapping them to White)
    Identifier = { fg = fg },
    Function = { fg = fg },
    Type = { fg = fg },
    PreProc = { fg = fg },
    Operator = { fg = fg },
    Constant = { fg = fg },
    Special = { fg = fg },
    Delimiter = { fg = fg },

    -- Treesitter (Modern Neovim syntax)
    ["@variable"] = { fg = fg },
    ["@function"] = { fg = fg },
    ["@type"] = { fg = fg },
    ["@property"] = { fg = fg },
    ["@field"] = { fg = fg },
    ["@parameter"] = { fg = fg },
    ["@keyword"] = { fg = keyword, bold = true },
    ["@string"] = { fg = string },
    ["@comment"] = { fg = comment, italic = true },
    ["@punctuation.bracket"] = { fg = fg },
  }

  for group, settings in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

setup_theme()
