local opt = vim.opt

-- =============================================================================
-- UI / VIEW
-- =============================================================================
opt.number = true -- Show absolute line numbers
opt.relativenumber = true -- Show relative numbers for easier movement
opt.cursorline = true -- Highlight current line
opt.wrap = false -- Disable line wrapping
opt.scrolloff = 10 -- Keep context above/below cursor
opt.sidescrolloff = 8 -- Keep horizontal context

opt.termguicolors = true -- Enable true color support
opt.signcolumn = "yes" -- Always show sign column (for LSP/git)

opt.colorcolumn = "80" -- Visual guide at column 80
opt.winborder = "rounded" -- Rounded borders for floating windows

opt.showmatch = true -- Highlight matching brackets
opt.matchtime = 2 -- Duration of match highlight (in tenths of a second)

opt.winminwidth = 5 -- Prevent windows from becoming too narrow

-- =============================================================================
-- INDENTATION
-- =============================================================================
opt.tabstop = 2 -- Number of spaces a tab counts for
opt.shiftwidth = 2 -- Spaces used for each indentation step
opt.softtabstop = 2 -- Spaces inserted when pressing <Tab>
opt.expandtab = true -- Use spaces instead of tabs
opt.smartindent = true -- Smart auto-indenting for new lines
opt.autoindent = true -- Copy indent from current line

-- =============================================================================
-- SEARCH
-- =============================================================================
opt.ignorecase = true -- Case-insensitive search by default
opt.smartcase = true -- Case-sensitive if uppercase is used
opt.incsearch = true -- Show matches while typing
opt.hlsearch = true -- Highlight all matches

-- =============================================================================
-- COMPLETION
-- =============================================================================
opt.completeopt = "menu,menuone,noselect,fuzzy"
-- menu      → show completion menu
-- menuone   → show even for single match
-- noselect  → don't auto-select item
-- fuzzy     → enable fuzzy matching

-- =============================================================================
-- EDITING BEHAVIOR
-- =============================================================================
opt.virtualedit = "block" -- Allow cursor past EOL in visual block mode
opt.iskeyword = "@,48-57,_,192-255,-" -- Treat '-' as part of words

opt.backspace = "indent,eol,start" -- Allow backspace over everything
opt.timeoutlen = 1000 -- Time to wait for mapped sequence

opt.mouse = "a" -- Enable mouse support
opt.clipboard = "unnamedplus" -- Use system clipboard

opt.confirm = true -- Ask before closing unsaved buffers
opt.autoread = true -- Auto-reload file changed outside Neovim

opt.splitbelow = true -- Horizontal splits go below
opt.splitright = true -- Vertical splits go right
opt.splitkeep = "screen" -- Keep viewport stable when splitting

-- =============================================================================
-- UNDO / FILE HANDLING
-- =============================================================================
opt.undofile = true -- Persistent undo across sessions
opt.undolevels = 10000 -- Maximum undo steps

opt.swapfile = false -- Disable swap files
opt.backup = false -- Disable backup files
opt.writebackup = false -- Disable backup before write

-- =============================================================================
-- PERFORMANCE
-- =============================================================================
opt.updatetime = 300 -- Faster CursorHold / LSP updates

opt.synmaxcol = 300 -- Stop syntax highlight after column 300 (perf)
opt.maxmempattern = 20000 -- Memory limit for pattern matching
opt.redrawtime = 10000 -- Time limit for screen redraw

opt.encoding = "utf-8" -- Default encoding

-- =============================================================================
-- SEARCH (EXTERNAL / GREP)
-- =============================================================================
opt.grepprg = "rg --vimgrep" -- Use ripgrep for :grep
opt.grepformat = "%f:%l:%c:%m" -- Format for quickfix parsing

-- =============================================================================
-- FOLDING
-- =============================================================================
vim.wo.foldmethod = "expr" -- Folding based on expression (e.g. treesitter)
opt.foldlevel = 99 -- Start with all folds open

-- =============================================================================
-- POPUP / MARKDOWN / UI DETAILS
-- =============================================================================
opt.pumheight = 10 -- Max items in completion menu
opt.conceallevel = 2 -- Hide markup (e.g. **bold**) in Markdown
opt.concealcursor = "" -- Don't conceal text under cursor

opt.laststatus = 3
