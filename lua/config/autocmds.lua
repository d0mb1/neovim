-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- mini-files rounded border set
vim.api.nvim_create_autocmd("User", {
  pattern = "MiniFilesWindowOpen",
  callback = function(args)
    local win_id = args.data.win_id

    -- Customize window-local settings
    -- vim.wo[win_id].winblend = 50
    local config = vim.api.nvim_win_get_config(win_id)
    config.border = "rounded"
    config.title_pos = "center"
    vim.api.nvim_win_set_config(win_id, config)
  end,
})
-- config = function(_, opts)
--   -- setup compat sources
--   local enabled = opts.sources.default
--   for _, source in ipairs(opts.sources.compat or {}) do
--     opts.sources.providers[source] = vim.tbl_deep_extend(
--       "force",
--       { name = source, module = "blink.compat.source" },
--       opts.sources.providers[source] or {}
--     )
--     if type(enabled) == "table" and not vim.tbl_contains(enabled, source) then
--       table.insert(enabled, source)
--     end
--   end
--
--   -- add ai_accept to <Tab> key
--   if not opts.keymap["<Tab>"] then
--     if opts.keymap.preset == "super-tab" then -- super-tab
--       opts.keymap["<Tab>"] = {
--         require("blink.cmp.keymap.presets")["super-tab"]["<Tab>"][1],
--         LazyVim.cmp.map({ "snippet_forward", "ai_accept" }),
--         "fallback",
--       }
--     else -- other presets
--       opts.keymap["<Tab>"] = {
--         LazyVim.cmp.map({ "snippet_forward", "ai_accept" }),
--         "fallback",
--       }
--     end
--   end
--
--   ---  NOTE: compat with latest version. Currenlty 0.7.6
--   if not vim.g.lazyvim_blink_main then
--     ---@diagnostic disable-next-line: inject-field
--     opts.sources.completion = opts.sources.completion or {}
--     opts.sources.completion.enabled_providers = enabled
--     if vim.tbl_get(opts, "completion", "menu", "draw", "treesitter") then
--       ---@diagnostic disable-next-line: assign-type-mismatch
--       opts.completion.menu.draw.treesitter = true
--     end
--   end
--
--   -- Unset custom prop to pass blink.cmp validation
--   opts.sources.compat = nil
--
--   -- check if we need to override symbol kinds
--   for _, provider in pairs(opts.sources.providers or {}) do
--     ---@cast provider blink.cmp.SourceProviderConfig|{kind?:string}
--     if provider.kind then
--       local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
--       local kind_idx = #CompletionItemKind + 1
--
--       CompletionItemKind[kind_idx] = provider.kind
--       ---@diagnostic disable-next-line: no-unknown
--       CompletionItemKind[provider.kind] = kind_idx
--
--       ---@type fun(ctx: blink.cmp.Context, items: blink.cmp.CompletionItem[]): blink.cmp.CompletionItem[]
--       local transform_items = provider.transform_items
--       ---@param ctx blink.cmp.Context
--       ---@param items blink.cmp.CompletionItem[]
--       provider.transform_items = function(ctx, items)
--         items = transform_items and transform_items(ctx, items) or items
--         for _, item in ipairs(items) do
--           item.kind = kind_idx or item.kind
--         end
--         return items
--       end
--
--       -- Unset custom prop to pass blink.cmp validation
--       provider.kind = nil
--     end
--   end
--
--   require("blink.cmp").setup(opts)
-- end
