_G.Config = {}

vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

local misc = require("mini.misc")

Config.now = function(f)
  misc.safely("now", f)
end

Config.later = function(f)
  misc.safely("later", f)
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("i", "jk", "<esc>")

require("config")
require("plugins")
