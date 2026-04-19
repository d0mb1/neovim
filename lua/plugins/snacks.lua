local Snacks = require("snacks")

Snacks.setup({
  animate = { enabled = false },
  bigfile = { enabled = true },
  bufdelete = { enabled = false },
  dashboard = { enabled = false },
  debug = { enabled = false },
  dim = { enabled = false },
  explorer = { enabled = true, replace_netrw = false },
  gh = { enabled = false },
  git = { enabled = true },
  gitbrowse = { enabled = false },
  image = { enabled = true },
  indent = { enabled = true },
  input = { enabled = true },
  keymap = { enabled = false },
  layout = { enabled = false },
  lazygit = { enabled = false },
  notifier = { enabled = true },
  notify = { enabled = true },
  profiler = { enabled = false },
  quickfile = { enabled = true },
  rename = { enabled = true },
  scope = { enabled = false },
  scratch = { enabled = false },
  scroll = { enabled = false },
  statuscolumn = { enabled = true },
  terminal = {
    enabled = true,
    win = {
      position = "float",
      style = "terminal",
      border = "rounded",
      title = "Terminal",
    },
  },
  toggle = {
    enabled = true,
    which_key = false,
  },
  words = { enabled = false },
  zen = { enabled = false },

  picker = {
    enabled = true,
    actions = {
      opencode_send = function(...)
        return require("opencode").snacks_picker_send(...)
      end,
    },
    win = {
      input = {
        keys = {
          ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
        },
      },
    },
    sources = {
      files = {
        hidden = true,
        ignored = true,
        win = {
          input = {
            keys = {
              ["<S-h>"] = "toggle_hidden",
              ["<S-i>"] = "toggle_ignored",
              ["<S-f>"] = "toggle_follow",
              ["<C-y>"] = { "yazi_copy_relative_path", mode = { "n", "i" } },
            },
          },
        },
        exclude = {
          "**/.git/*",
          "**/.jj/*",
          "**/node_modules/*",
          "**/.yarn/cache/*",
          "**/.yarn/install*",
          "**/.yarn/releases/*",
          "**/.pnpm-store/*",
          "**/.idea/*",
          "**/.DS_Store",
          "build/*",
          "coverage/*",
          "dist/*",
          "hodor-types/*",
          "**/target/*",
          "**/public/*",
          "**/digest*.txt",
          "**/.node-gyp/**",
        },
      },
      grep = {
        hidden = true,
        ignored = true,
        win = {
          input = {
            keys = {
              ["<S-h>"] = "toggle_hidden",
              ["<S-i>"] = "toggle_ignored",
              ["<S-f>"] = "toggle_follow",
            },
          },
        },
        exclude = {
          "**/.git/*",
          "**/node_modules/*",
          "**/.yarn/cache/*",
          "**/.yarn/install*",
          "**/.yarn/releases/*",
          "**/.pnpm-store/*",
          "**/.venv/*",
          "**/.idea/*",
          "**/.DS_Store",
          "**/yarn.lock",
          "build*/*",
          "coverage/*",
          "dist/*",
          "certificates/*",
          "hodor-types/*",
          "**/target/*",
          "**/public/*",
          "**/digest*.txt",
          "**/.node-gyp/**",
        },
      },
      grep_buffers = {},
      explorer = {
        hidden = true,
        ignored = true,
        supports_live = true,
        auto_close = true,
        diagnostics = true,
        diagnostics_open = false,
        focus = "list",
        follow_file = true,
        git_status = true,
        git_status_open = false,
        git_untracked = true,
        jump = { close = true },
        tree = true,
        watch = true,
        exclude = {
          ".git",
          ".pnpm-store",
          ".venv",
          ".DS_Store",
          "**/.node-gyp/**",
        },
      },
    },
  },
})

vim.api.nvim_create_autocmd("User", {
  callback = function()
    Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>ts", { desc = "Spelling" })
    Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>tw", { desc = "Wrap" })
    Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>tL", { desc = "Relative Number" })
    Snacks.toggle.diagnostics():map("<leader>td", { desc = "Diagnostics" })
    Snacks.toggle.line_number():map("<leader>tn", { desc = "Line Numbers" })
    Snacks.toggle
      .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2, name = "Conceal Level" })
      :map("<leader>tc", { desc = "Conceal Level" })
    -- Snacks.toggle.treesitter({ name = "Treesitter" }):map("<leader>tT", { desc = "Treesitter" })
    Snacks.toggle
      .option("background", { off = "light", on = "dark", name = "Dark Background" })
      :map("<leader>tb", { desc = "Background" })
    -- Snacks.toggle.dim():map("<leader>uD")
    -- Snacks.toggle.animate():map("<leader>ua")
    -- Snacks.toggle.indent():map("<leader>ug")
    -- Snacks.toggle.scroll():map("<leader>uS")
    -- Snacks.toggle.profiler():map("<leader>dpp")
    -- Snacks.toggle.profiler_highlights():map("<leader>dph")
    -- Snacks.toggle.zoom():map("<leader>wm"):map("<leader>uZ")
    -- Snacks.toggle.zen():map("<leader>uz")
  end,
})

-- stylua: ignore start
local keymaps = {
  -- Top Pickers & Explorer
  { "<leader><space>", function() Snacks.picker.smart() end, desc = "   Smart Find Files" },
  { "<leader>nN", function() Snacks.picker.notifications() end, desc = "Notification History" },
  { "<leader>nd", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
  { "<leader>nn", function() Snacks.notifier.show_history() end, desc = "Notification History" },
  { "<leader>et", function() Snacks.explorer() end, desc = "Snacks Tree" },

  -- find
  -- { "<leader>fB", function() Snacks.picker.buffers() end, desc = "Buffers" },
  -- { "<leader>fC", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
  { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
  { "<leader>fG", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
  -- { "<leader>fP", function() Snacks.picker.projects() end, desc = "Projects" },
  { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },

  -- Grep
  { "<leader>fb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
  { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },
  { "<leader>fB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
  { "<leader>fw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },

  -- search
  { '<leader>f"', function() Snacks.picker.registers() end, desc = "Registers" },
  { '<leader>f/', function() Snacks.picker.search_history() end, desc = "Search History" },
  { "<leader>fa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
  { "<leader>fc", function() Snacks.picker.command_history() end, desc = "Command History" },
  { "<leader>fC", function() Snacks.picker.commands() end, desc = "Commands" },
  { "<leader>fd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
  { "<leader>fD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
  { "<leader>fH", function() Snacks.picker.highlights() end, desc = "Highlights" },
  { "<leader>fi", function() Snacks.picker.icons() end, desc = "Icons" },
  { "<leader>fj", function() Snacks.picker.jumps() end, desc = "Jumps" },
  { "<leader>fk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
  { "<leader>fl", function() Snacks.picker.loclist() end, desc = "Location List" },
  { "<leader>fm", function() Snacks.picker.marks() end, desc = "Marks" },
  { "<leader>fM", function() Snacks.picker.man() end, desc = "Man Pages" },
  -- { "<leader>fp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
  { "<leader>fq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
  { "<leader>fR", function() Snacks.picker.resume() end, desc = "Resume" },
  { "<leader>fu", function() Snacks.picker.undo() end, desc = "Undo History" },
  { "<leader>ft", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
  { "<leader>fh", function() Snacks.picker.help() end, desc = "Help" },

  -- git
  { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
  { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
  { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
  { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
  { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
  { "<leader>gp", function() Snacks.picker.git_diff() end, desc = "Git Diff Picker (Hunks)" },
  { "<leader>gP", function() Snacks.picker.git_diff({ base = "origin" }) end, desc = "Git Diff Picker(origin)" },
  { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },

  -- LSP
  { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Definition" },
  { "grd", function() Snacks.picker.lsp_declarations() end, desc = "Declaration" },
  { "grr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
  { "gri", function() Snacks.picker.lsp_implementations() end, desc = "Implementation" },
  { "grt", function() Snacks.picker.lsp_type_definitions() end, desc = "Type Definition" },
  { "<leader>fs", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
  { "<leader>fS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
  -- { "gai", function() Snacks.picker.lsp_incoming_calls() end, desc = "C[a]lls Incoming", has = "callHierarchy/incomingCalls" },
  -- { "gao", function() Snacks.picker.lsp_outgoing_calls() end, desc = "C[a]lls Outgoing", has = "callHierarchy/outgoingCalls" },

  -- buffers
  { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete buffer", mode = { "n" }, },
  { "<leader>bo", function() Snacks.bufdelete.other() end, desc = "Delete other buffers", mode = { "n" }, },

  -- terminal
  { "<leader>tT", function() Snacks.terminal() end, desc = "Terminal (cwd)", mode = "n", },
  { "<leader>tt", function() Snacks.terminal(nil, { cwd = vim.fn.getcwd() }) end, desc = "Terminal (Root Dir)", mode = "n" },
  { "<c-:>", function() Snacks.terminal(nil, { cwd = vim.fn.getcwd() }) end, desc = "Terminal (Root Dir)", mode = "n" },
  { "<c-/>", function() Snacks.terminal() end, desc = "Toggle Terminal", mode = {"n", "t"} },
  { "<c-t>", function() Snacks.terminal() end, desc = "Toggle Terminal", mode = {"n", "t"} },
  { "<c-_>", function() Snacks.terminal(nil, { cwd = vim.fn.getcwd() }) end, desc = "which_key_ignore", mode = "n" },

  -- Other
  -- { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
  -- { "<leader>Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
  { "<leader>.",  function() Snacks.scratch() end, desc = "   Toggle Scratch Buffer" },
  { "<leader>S",  function() Snacks.scratch.select() end, desc = "   Select Scratch Buffer" },
  { "<leader>lR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
  { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
  { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
  { "<c-_>", function() Snacks.terminal() end, desc = "which_key_ignore" },
  { "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
  { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
  {
    "<leader>N",
    desc = "   Neovim News",
    function()
      Snacks.win({
        file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
        width = 0.6,
        height = 0.6,
        wo = {
          -- winboarder = "rounded",
          spell = false,
          wrap = false,
          signcolumn = "yes",
          statuscolumn = " ",
          conceallevel = 3,
        },
      })
    end,
  }
}

vim.api.nvim_create_autocmd("User", {
  pattern = "MiniFilesActionRename",
  callback = function(event)
    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesExplorerClose",
      callback = function()
        print("MINIFILES CLOSED")
        Snacks.rename.on_rename_file(event.data.from, event.data.to)
      end
    })
  end,
})

-- stylua: ignore end
for _, map in ipairs(keymaps) do
  local opts = { desc = map.desc }
  if map.silent ~= nil then
    opts.silent = map.silent
  end
  if map.noremap ~= nil then
    opts.noremap = map.noremap
  else
    opts.noremap = true
  end
  if map.expr ~= nil then
    opts.expr = map.expr
  end

  local mode = map.mode or "n"
  vim.keymap.set(mode, map[1], map[2], opts)
end
