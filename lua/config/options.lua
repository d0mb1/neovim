-- =============================================================================
-- UI / VIEW
-- =============================================================================
vim.opt.number = true -- Show absolute line numbers
vim.opt.relativenumber = true -- Show relative numbers for easier movement
vim.opt.cursorline = true -- Highlight current line
vim.opt.wrap = false -- Disable line wrapping
vim.opt.scrolloff = 10 -- Keep context above/below cursor
vim.opt.sidescrolloff = 8 -- Keep horizontal context

vim.opt.termguicolors = true -- Enable true color support
vim.opt.signcolumn = "yes" -- Always show sign column (for LSP/git)

vim.opt.colorcolumn = "80" -- Visual guide at column 80
vim.opt.winborder = "rounded" -- Rounded borders for floating windows

vim.opt.showmatch = true -- Highlight matching brackets
vim.opt.matchtime = 2 -- Duration of match highlight (in tenths of a second)

vim.opt.winminwidth = 5 -- Prevent windows from becoming too narrow

vim.opt.showmode = false

-- require("vim._core.ui2").enable({})

-- =============================================================================
-- INDENTATION
-- =============================================================================
vim.opt.tabstop = 2 -- Number of spaces a tab counts for
vim.opt.shiftwidth = 2 -- Spaces used for each indentation step
vim.opt.softtabstop = 2 -- Spaces inserted when pressing <Tab>
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.smartindent = true -- Smart auto-indenting for new lines
vim.opt.autoindent = true -- Copy indent from current line
vim.opt.smarttab = true -- Makes tab instert 'shiftwidth' number of spaces at the start of a line

-- =============================================================================
-- SEARCH
-- =============================================================================
vim.opt.ignorecase = true -- Case-insensitive search by default
vim.opt.smartcase = true -- Case-sensitive if uppercase is used
vim.opt.incsearch = true -- Show matches while typing
vim.opt.hlsearch = true -- Highlight all matches

-- =============================================================================
-- COMPLETION
-- =============================================================================
vim.opt.completeopt = "menu,menuone,noselect,fuzzy"
vim.opt.pumborder = "rounded"
-- menu      → show completion menu
-- menuone   → show even for single match
-- noselect  → don't auto-select item
-- fuzzy     → enable fuzzy matching

-- =============================================================================
-- EDITING BEHAVIOR
-- =============================================================================
vim.opt.virtualedit = "block" -- Allow cursor past EOL in visual block mode
vim.opt.iskeyword = "@,48-57,_,192-255,-" -- Treat '-' as part of words

vim.opt.backspace = "indent,eol,start" -- Allow backspace over everything
vim.opt.timeoutlen = 1000 -- Time to wait for mapped sequence

vim.opt.mouse = "a" -- Enable mouse support
vim.opt.clipboard = "unnamedplus" -- Use system clipboard

vim.opt.confirm = true -- Ask before closing unsaved buffers
vim.opt.autoread = true -- Auto-reload file changed outside Neovim

vim.opt.splitbelow = true -- Horizontal splits go below
vim.opt.splitright = true -- Vertical splits go right
vim.opt.splitkeep = "screen" -- Keep viewport stable when splitting

-- =============================================================================
-- UNDO / FILE HANDLING
-- =============================================================================
vim.opt.undofile = true -- Persistent undo across sessions
vim.opt.undolevels = 10000 -- Maximum undo steps

vim.opt.swapfile = false -- Disable swap files
vim.opt.backup = false -- Disable backup files
vim.opt.writebackup = false -- Disable backup before write

-- =============================================================================
-- PERFORMANCE
-- =============================================================================
vim.opt.updatetime = 300 -- Faster CursorHold / LSP updates

vim.opt.synmaxcol = 300 -- Stop syntax highlight after column 300 (perf)
vim.opt.maxmempattern = 20000 -- Memory limit for pattern matching
vim.opt.redrawtime = 10000 -- Time limit for screen redraw

vim.opt.encoding = "utf-8" -- Default encoding

-- =============================================================================
-- SEARCH (EXTERNAL / GREP)
-- =============================================================================
vim.opt.grepprg = "rg --vimgrep" -- Use ripgrep for :grep
vim.opt.grepformat = "%f:%l:%c:%m" -- Format for quickfix parsing

-- =============================================================================
-- FOLDING
-- =============================================================================
vim.wo.foldmethod = "expr" -- Folding based on expression (e.g. treesitter)
vim.opt.foldlevel = 99 -- Start with all folds open

-- =============================================================================
-- POPUP / MARKDOWN / UI DETAILS
-- =============================================================================
vim.opt.pumheight = 10 -- Max items in completion menu
vim.opt.conceallevel = 2 -- Hide markup (e.g. **bold**) in Markdown
vim.opt.concealcursor = "" -- Don't conceal text under cursor

vim.opt.laststatus = 3
