local M = {}

local infer = require("typed_vars.infer")
local scanner = require("typed_vars.scanner")

M.hl_map = {
  number = "TypedVarNumber",
  string = "TypedVarString",
  boolean = "TypedVarBoolean",
}

function M.define_default_hls()
  vim.api.nvim_set_hl(0, "TypedVarNumber", { link = "Number", default = true })
  vim.api.nvim_set_hl(0, "TypedVarString", { link = "String", default = true })
  vim.api.nvim_set_hl(0, "TypedVarBoolean", { link = "Boolean", default = true })
end

function M.apply(bufnr, ns)
  vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)

  local parser = vim.treesitter.get_parser(bufnr)
  if not parser then
    return
  end

  local tree = parser:parse()[1]
  if not tree then
    return
  end

  local root = tree:root()
  local vars = infer.collect_typed_variables(bufnr, root)

  if vim.tbl_isempty(vars) then
    return
  end

  local refs = scanner.find_identifier_references(bufnr, root, vars)

  for _, item in ipairs(refs) do
    local hl_group = M.hl_map[item.var_type]
    if hl_group then
      vim.api.nvim_buf_set_extmark(bufnr, ns, item.row, item.col, {
        end_row = item.end_row,
        end_col = item.end_col,
        hl_group = hl_group,
        priority = 120,
      })
    end
  end
end

return M
