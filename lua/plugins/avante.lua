vim.pack.add({
  "nvim-lua/plenary.nvim",
  "MunifTanjim/nui.nvim",
  --- The below dependencies are optional,
  -- "stevearc/dressing.nvim", -- for input provider dressing
  "folke/snacks.nvim", -- for input provider snacks
  "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
  "zbirenbaum/copilot.lua", -- for providers='copilot'
  "https://github.com/yetone/avante.nvim",
})

require("avante").setup({
  -- recommended settings
  provider = "copilot",
  selector = {
    provider = "snacks",
  },
  input = {
    provider = "snacks",
    provider_opts = {
      -- Additional snacks.input options
      title = "Avante Input",
      icon = " ",
    },
  },
})
