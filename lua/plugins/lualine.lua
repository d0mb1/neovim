-- catppucin palette
local palette = require("catppuccin.palettes").get_palette("mocha")

-- custom component to show macro recording status
local function macro_component()
  local reg = vim.fn.reg_recording()
  if reg == "" then
    return ""
  end -- Not recording
  return "recording @" .. reg
end

-- Refresh lualine when recording starts or stops
vim.api.nvim_create_autocmd("RecordingEnter", {
  callback = function()
    require("lualine").refresh({
      place = { "statusline" },
    })
  end,
})
vim.api.nvim_create_autocmd("RecordingLeave", {
  callback = function()
    -- Use a tiny timer because the register isn't cleared
    -- the exact millisecond the event fires
    local timer = vim.loop.new_timer()
    timer:start(
      50,
      0,
      vim.schedule_wrap(function()
        require("lualine").refresh({
          place = { "statusline" },
        })
      end)
    )
  end,
})

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "│", right = "│" },
    section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = {
      {
        "filename",
        path = 1,
        symbols = {
          modified = "",
        },
      },
    },
    lualine_x = {
      {
        "searchcount",
      },
      {
        "selectioncount",
      },
      {
        macro_component,
        color = {
          -- fg = cp_palette.base,
          -- bg = cp_palette.peach,
          fg = palette.peach,
          gui = "bold",
        },
      },
    },
    lualine_y = {
      {
        "lsp_status",
        icon = " ",
        symbols = {
          done = "",
          separator = " | ",
        },
      },
      {
        "filetype",
        colored = true, -- Displays filetype icon in color if set to true
        icon_only = true, -- Display only an icon for filetype
      },
      -- {
      --   "filetype",
      --   icon_only = true,
      -- },
    },
    lualine_z = { "progress", "location" },
  },
  inactive_sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = {
      {
        "filename",
        path = 1,
        symbols = {
          modified = "",
        },
      },
    },
    lualine_x = {
      {
        "searchcount",
      },
      {
        "selectioncount",
      },
    },
    lualine_y = {
      {
        macro_component,
        color = {
          -- fg = "#212132",
          fg = palette.base,
          bg = palette.peach,
          gui = "bold",
        },
      },
      {
        "lsp_status",
        icon = " ",
        symbols = {
          done = "",
          separator = " | ",
        },
      },
      {
        "filetype",
        colored = true, -- Displays filetype icon in color if set to true
        icon_only = true, -- Display only an icon for filetype
      },
      -- {
      --   "filetype",
      --   icon_only = true,
      -- },
    },
    lualine_z = { "progress", "location" },
  },
})
