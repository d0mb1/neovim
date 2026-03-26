local M = {}

local ns = vim.api.nvim_create_namespace("typed_vars")

M.config = {
  enabled = true,
  filetypes = {
    javascript = true,
    typescript = true,
    javascriptreact = true,
    typescriptreact = true,
    lua = true,
    python = true,
  },
  debounce_ms = 100,
}

M.ns = ns
M.augroup = nil

local function is_supported(bufnr)
  local ft = vim.bo[bufnr].filetype
  return M.config.filetypes[ft] == true
end

function M.refresh(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()

  if not M.config.enabled then
    return
  end

  if not vim.api.nvim_buf_is_valid(bufnr) then
    return
  end

  if not is_supported(bufnr) then
    return
  end

  require("typed_vars.highlights").apply(bufnr, ns)
end

function M.enable()
  M.config.enabled = true

  if M.augroup then
    vim.api.nvim_del_augroup_by_id(M.augroup)
  end

  M.augroup = vim.api.nvim_create_augroup("TypedVars", { clear = true })

  vim.api.nvim_create_autocmd({
    "BufEnter",
    "TextChanged",
    "TextChangedI",
    "InsertLeave",
  }, {
    group = M.augroup,
    callback = function(args)
      vim.defer_fn(function()
        require("typed_vars").refresh(args.buf)
      end, M.config.debounce_ms)
    end,
  })

  require("typed_vars.highlights").define_default_hls()

  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    M.refresh(bufnr)
  end
end

function M.disable()
  M.config.enabled = false

  if M.augroup then
    vim.api.nvim_del_augroup_by_id(M.augroup)
    M.augroup = nil
  end

  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_valid(bufnr) then
      vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)
    end
  end
end

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
  require("typed_vars.highlights").define_default_hls()

  if M.config.enabled then
    M.enable()
  end
end

return M
