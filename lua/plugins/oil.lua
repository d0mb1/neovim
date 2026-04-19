require("oil").setup({
  columns = {
    "icon",
    -- "permissions",
    -- { "size", highlight = "DiagnosticError" },
    -- { "mtime", highlight = "Special" },
    {
      -- "icon",
      -- default_file = ...,
      directory = ...,
    },
  },

  constrain_cursor = "name",

  delete_to_trash = true,

  keymaps = {
    ["g?"] = { "actions.show_help", mode = "n" },
    ["<CR>"] = "actions.select",
    ["<C-s>"] = { "actions.select", opts = { vertical = true } },
    ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
    ["<C-t>"] = { "actions.select", opts = { tab = true } },
    ["<C-p>"] = "actions.preview",
    ["q"] = { "actions.close", mode = "n" },
    ["<C-l>"] = "actions.refresh",
    ["<BS>"] = { "actions.parent", mode = "n" },
    ["_"] = { "actions.open_cwd", mode = "n" },
    ["`"] = { "actions.cd", mode = "n" },
    ["g~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
    ["gs"] = { "actions.change_sort", mode = "n" },
    ["gx"] = "actions.open_external",
    ["g."] = { "actions.toggle_hidden", mode = "n" },
    ["g\\"] = { "actions.toggle_trash", mode = "n" },
  },

  view_options = {
    -- Show files and directories that start with "."
    show_hidden = true,
    -- This function defines what is considered a "hidden" file
    is_hidden_file = function(name)
      local m = name:match("^%.")
      return m ~= nil
    end,
    -- Customize the highlight group for the file name
    highlight_filename = function()
      return nil
    end,
  },

  win_options = {
    signcolumn = "yes:2",
  },

  float = {
    -- Padding around the floating window
    padding = 4,
    -- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    max_width = 0,
    max_height = 0,
    border = nil,
    win_options = {
      winblend = 0,
    },
    -- optionally override the oil buffers window title with custom function: fun(winid: integer): string
    get_win_title = nil,
    -- preview_split: Split direction: "auto", "left", "right", "above", "below".
    preview_split = "auto",
    -- This is the config that will be passed to nvim_open_win.
    -- Change values here to customize the layout
    override = function(conf)
      return conf
    end,
  },

  -- Configuration for the file preview window
  preview_win = {
    -- Whether the preview window is automatically updated when the cursor is moved
    update_on_cursor_moved = true,
    -- How to open the preview window "load"|"scratch"|"fast_scratch"
    preview_method = "fast_scratch",
    -- A function that returns true to disable preview on a file e.g. to avoid lag
    disable_preview = function()
      return false
    end,
    -- Window-local options to use for preview window buffers
    win_options = {},
  },
})

vim.keymap.set("n", "<leader>eo", "<CMD>Oil<CR>", { desc = "Oil Open Parent Directory" })

-- vim.api.nvim_create_autocmd("User", {
--   pattern = "OilEnter",
--   callback = vim.schedule_wrap(function(args)
--     local oil = require("oil")
--     if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
--       oil.open_preview()
--     end
--   end),
-- })
