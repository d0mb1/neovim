return {
  "echasnovski/mini.files",
  version = false,
  config = function()
    require("mini.files").setup({
      mappings = {
        close = "q",
        go_in = "l",
        go_in_plus = "L",
        go_out = "h",
        go_out_plus = "H",
        mark_goto = "'",
        mark_set = "m",
        reset = "<BS>",
        reveal_cwd = "@",
        show_help = "g?",
        synchronize = "s",
        trim_left = "<",
        trim_right = ">",
      },
      options = {
        permanent_delete = false,
      },
      windows = {
        -- Maximum number of windows to show side by side
        max_number = 3,
        -- Whether to show preview of file/directory under cursor
        preview = true,
        -- Width of focused window
        width_focus = 40,
        -- Width of non-focused window
        width_nofocus = 20,
        -- Width of preview window
        width_preview = 80,
        border = "rounded",
      },
    })
    vim.keymap.set("n", "<leader>e", ":lua MiniFiles.open()<CR>", { desc = "Open Files" })
  end,
}
