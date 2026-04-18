require("mini.ai").setup()
require("mini.comment").setup()
require("mini.cursorword").setup()
require("mini.trailspace").setup()
-- require("mini.statusline").setup()
-- require("mini.tabline").setup()
require("mini.pairs").setup()
require("mini.sessions").setup()
-- require("mini.pick").setup()
require("mini.move").setup()
require("mini.icons").setup()
require("mini.bracketed").setup()
-- require("mini.bufremove").setup()
-- require("mini.diff").setup()
require("mini.extra").setup()
-- require("mini.git").setup()
-- require("mini.jump2d").setup()
require("mini.visits").setup()
require("mini.surround").setup({
  mappings = {
    add = "gsa", -- Add surrounding in Normal and Visual modes
    delete = "gsd", -- Delete surrounding
    find = "gsf", -- Find surrounding (to the right)
    find_left = "gsF", -- Find surrounding (to the left)
    highlight = "gsh", -- Highlight surrounding
    replace = "gsr", -- Replace surrounding

    suffix_last = "l", -- Suffix to search with "prev" method
    suffix_next = "n", -- Suffix to search with "next" method
  },
})

-- require("mini.jump").setup({
--   -- Module mappings. Use `''` (empty string) to disable one.
--   mappings = {
--     forward = "f",
--     backward = "F",
--     forward_till = "t",
--     backward_till = "T",
--     repeat_jump = ";",
--   },
--
--   -- Delay values (in ms) for different functionalities. Set any of them to
--   -- a very big number (like 10^7) to virtually disable.
--   delay = {
--     -- Delay between jump and highlighting all possible jumps
--     highlight = 250,
--
--     -- Delay between jump and automatic stop if idle (no jump is done)
--     idle_stop = 10000000,
--   },
--
--   -- Whether to disable showing non-error feedback
--   -- This also affects (purely informational) helper messages shown after
--   -- idle time if user input is required.
--   silent = false,
-- })

require("mini.cmdline").setup({
  autocomplete = {
    enable = false,
  },
  autocorrect = {
    enable = false,
  },
  autopeek = {
    enable = true,
    n_context = 5,
  },
})

require("mini.basics").setup({
  autocommands = {
    basic = true,
  },
  options = {
    extra_ui = false,
  },
})

require("mini.splitjoin").setup()

require("mini.files").setup({
  mappings = {
    synchronize = "s",
  },
  windows = {
    -- Maximum number of windows to show side by side
    max_number = math.huge,
    -- Whether to show preview of file/directory under cursor
    preview = true,
    -- Width of focused window
    width_focus = 30,
    -- Width of non-focused window
    width_nofocus = 20,
    -- Width of preview window
    width_preview = 40,
  },
})

local hipatterns = require("mini.hipatterns")
hipatterns.setup({
  highlighters = {
    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
    fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
    hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
    todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
    note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
    -- Highlight hex color strings (`#rrggbb`) using that color
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
})

local miniclue = require("mini.clue")
miniclue.setup({
  window = {
    delay = 500,
    config = {
      width = "auto",
    },
  },
  triggers = {
    -- Leader triggers
    { mode = { "n", "x" }, keys = "<Leader>" },
    -- `[` and `]` keys
    { mode = "n", keys = "[" },
    { mode = "n", keys = "]" },
    -- Built-in completion
    { mode = "i", keys = "<C-x>" },
    -- `g` key
    { mode = { "n", "x" }, keys = "g" },
    -- Marks
    { mode = { "n", "x" }, keys = "'" },
    { mode = { "n", "x" }, keys = "`" },
    -- Registers
    { mode = { "n", "x" }, keys = '"' },
    { mode = { "i", "c" }, keys = "<C-r>" },
    -- Window commands
    { mode = "n", keys = "<C-w>" },
    -- `z` key
    { mode = { "n", "x" }, keys = "z" },
  },
  clues = {
    { mode = "n", keys = "<Leader>b", desc = "  +Buffer" },
    { mode = "n", keys = "<Leader>e", desc = "  +Explore" },
    { mode = "n", keys = "<Leader>l", desc = "  +Language" },
    { mode = "n", keys = "<Leader>P", desc = "󰐱  +Plugin" },
    { mode = "n", keys = "<Leader>p", desc = "  +Project" },
    { mode = "n", keys = "<Leader>t", desc = "  +Toggle" },
    { mode = "n", keys = "<Leader>m", desc = "  +Markdown" },
    { mode = "n", keys = "<Leader>w", desc = "  +Window" },
    { mode = "n", keys = "<Leader>f", desc = "  +Find" },
    { mode = "n", keys = "<Leader>g", desc = "  +Git" },
    { mode = "n", keys = "<Leader>n", desc = "  +Notifications" },
    { mode = "n", keys = "<Leader>s", desc = "  +Search" },
    { mode = "n", keys = "<Leader>a", desc = "󰚩  +AI" },
    { mode = "n", keys = "<Leader><tab>", desc = "󰓩  +Tab" },
    { mode = "n", keys = "gl", desc = "+LSP" },
    { mode = "n", keys = "gs", desc = "+Surround" },
    miniclue.gen_clues.square_brackets(),
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.windows(),
    miniclue.gen_clues.z(),
  },
})

local starter = require("mini.starter")
-- Restore the most recent session (top of sessions list)
local function restore_latest_session()
  local sessions = require("mini.starter").sections.sessions(5, true)()
  if not sessions or #sessions == 0 then
    print("No sessions found.")
    return
  end
  local first_session = sessions[1]
  if not first_session or not first_session.action then
    print("Could not find a valid session to restore.")
    return
  end
  local session_name = first_session.name or first_session.action:match('"(.-)"')
  if session_name then
    require("mini.sessions").read(session_name, { force = true })
    print("Restored latest session: " .. session_name)
  else
    print("Could not extract session name.")
  end
end
-- Custom menu items
local my_items = {
  {
    name = "Open File Tree ──────────────────────────────────────  ",
    action = "lua require('mini.files').open()",
    section = "Basic actions",
  },
  {
    name = "Find File ───────────────────────────────────────────  ",
    action = "lua Snacks.dashboard.pick('files')",
    section = "Basic actions",
  },
  {
    name = "New File ────────────────────────────────────────────  ",
    action = ":ene | startinsert",
    section = "Basic actions",
  },
  {
    name = "Recent Files ──────────────────────────────────────── 󰥔 ",
    action = "lua Snacks.picker.recent()",
    section = "Basic actions",
  },
  {
    name = "Session Restore ─────────────────────────────────────  ",
    action = restore_latest_session,
    section = "Basic actions",
  },
  {
    name = "Quit ────────────────────────────────────────────────  ",
    action = ":q",
    section = "Basic actions",
  },
}
-- local header = [[
--  ╭────────────────────────────────────────────────────╮
--  │ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ │╮
--  │ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ││
--  │ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ││
--  │ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ││
--  │ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ││
--  │ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ││
--  ╰────────────────────────────────────────────────────╯│
--   ╰────────────────────────────────────────────────────╯
-- ]]
local small_header = [[
              █▀▀▄ █▀▀█ █▀▀█ █  █ ▀█▀ █▀█▀▄
              █  █ █▀▀▀ █  █ █ █   █  █ █ █
              ▀  ▀ ▀▀▀▀ ▀▀▀▀ ▀▀   ▀▀▀ ▀ ▀ ▀
]]
local function recent_files_columns(n, current_dir)
  n = n or 5

  return function()
    local items = {}
    local cwd = vim.fn.getcwd()
    local width = 55

    for _, f in ipairs(vim.v.oldfiles or {}) do
      if #items >= n then
        break
      end
      if vim.fn.filereadable(f) == 1 then
        if not current_dir or f:find(cwd, 1, true) == 1 then
          local name = vim.fn.fnamemodify(f, ":t")
          local path = vim.fn.fnamemodify(f, ":~:.")

          local padding = math.max(2, width - (#name + #path))
          local line = name .. string.rep(" ", padding) .. path

          table.insert(items, {
            -- name = string.format("%-15s %s", name, path),
            name = line,
            section = "Recent files",
            action = function()
              vim.cmd.edit(f)
            end,
          })
        end
      end
    end

    return items
  end
end
require("mini.starter").setup({
  header = small_header,
  items = {
    my_items,
    recent_files_columns(6, true),
    starter.sections.sessions(5, true),
  },
  footer = "",
  content_hooks = {
    starter.gen_hook.adding_bullet(),
    starter.gen_hook.aligning("center", "center"),
    starter.gen_hook.indexing("all", { "Basic actions", "Recent files (current directory)", "Recent files" }),
  },
})

-- Files
vim.keymap.set("n", "<space>ed", ":lua MiniFiles.open()<cr>", { desc = "Mini Directory" })
vim.keymap.set(
  "n",
  "<space>ef",
  ":lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<cr>",
  { desc = "Mini File Directory" }
)

-- Splitjoin
vim.keymap.set("n", "<space>ta", ":lua MiniSplitjoin.toggle()<cr>", { desc = "Toggle Arguments" })

-- Buffers
-- vim.keymap.set("n", "<space>bd", ":lua MiniBufremove.delete()<cr>", { desc = "Delete" })

-- Sessions
local session_new = 'MiniSessions.write(vim.fn.input("Session name: "))'
vim.keymap.set("n", "<leader>pd", '<Cmd>lua MiniSessions.select("delete")<CR>', { desc = "Delete" })
vim.keymap.set("n", "<leader>pn", "<Cmd>lua " .. session_new .. "<CR>", { desc = "New" })
vim.keymap.set("n", "<leader>po", '<Cmd>lua MiniSessions.select("read")<CR>', { desc = "Open" })
vim.keymap.set("n", "<leader>pw", "<Cmd>lua MiniSessions.write()<CR>", { desc = "Write current" })

-- Pick
-- All these use 'mini.pick'. See `:h MiniPick-overview` for an overview.
local pick_added_hunks_buf = '<Cmd>Pick git_hunks path="%" scope="staged"<CR>'
local pick_workspace_symbols_live = '<Cmd>Pick lsp scope="workspace_symbol_live"<CR>'

vim.keymap.set("n", "<leader>f/", '<Cmd>Pick history scope="/"<CR>', { desc = "/ history" })
vim.keymap.set("n", "<leader>f:", '<Cmd>Pick history scope=":"<CR>', { desc = ": history" })
vim.keymap.set("n", "<leader>fa", '<Cmd>Pick git_hunks scope="staged"<CR>', { desc = "Added hunks (all)" })
vim.keymap.set("n", "<leader>fA", pick_added_hunks_buf, { desc = "Added hunks (buf)" })
vim.keymap.set("n", "<leader>fb", "<Cmd>Pick buffers<CR>", { desc = "Buffers" })
vim.keymap.set("n", "<leader>fc", "<Cmd>Pick git_commits<CR>", { desc = "Commits (all)" })
vim.keymap.set("n", "<leader>fC", '<Cmd>Pick git_commits path="%"<CR>', { desc = "Commits (buf)" })
vim.keymap.set("n", "<leader>fd", '<Cmd>Pick diagnostic scope="all"<CR>', { desc = "Diagnostic workspace" })
vim.keymap.set("n", "<leader>fD", '<Cmd>Pick diagnostic scope="current"<CR>', { desc = "Diagnostic buffer" })
vim.keymap.set("n", "<leader>ff", "<Cmd>Pick files<CR>", { desc = "Files" })
vim.keymap.set("n", "<leader>fg", "<Cmd>Pick grep_live<CR>", { desc = "Grep live" })
vim.keymap.set("n", "<leader>fG", '<Cmd>Pick grep pattern="<cword>"<CR>', { desc = "Grep current word" })
vim.keymap.set("n", "<leader>fh", "<Cmd>Pick help<CR>", { desc = "Help tags" })
vim.keymap.set("n", "<leader>fH", "<Cmd>Pick hl_groups<CR>", { desc = "Highlight groups" })
vim.keymap.set("n", "<leader>fl", '<Cmd>Pick buf_lines scope="all"<CR>', { desc = "Lines (all)" })
vim.keymap.set("n", "<leader>fL", '<Cmd>Pick buf_lines scope="current"<CR>', { desc = "Lines (buf)" })
vim.keymap.set("n", "<leader>fm", "<Cmd>Pick git_hunks<CR>", { desc = "Modified hunks (all)" })
vim.keymap.set("n", "<leader>fM", '<Cmd>Pick git_hunks path="%"<CR>', { desc = "Modified hunks (buf)" })
vim.keymap.set("n", "<leader>fr", "<Cmd>Pick resume<CR>", { desc = "Resume" })
vim.keymap.set("n", "<leader>fR", '<Cmd>Pick lsp scope="references"<CR>', { desc = "References (LSP)" })
vim.keymap.set("n", "<leader>fs", pick_workspace_symbols_live, { desc = "Symbols workspace (live)" })
vim.keymap.set("n", "<leader>fS", '<Cmd>Pick lsp scope="document_symbol"<CR>', { desc = "Symbols document" })
vim.keymap.set("n", "<leader>fv", '<Cmd>Pick visit_paths cwd=""<CR>', { desc = "Visit paths (all)" })
vim.keymap.set("n", "<leader>fV", "<Cmd>Pick visit_paths<CR>", { desc = "Visit paths (cwd)" })
