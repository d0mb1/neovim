local M = {}

local function node_text(bufnr, node)
  return vim.treesitter.get_node_text(node, bufnr)
end

local identifier_types = {
  identifier = true,
}

local function walk(bufnr, node, vars, out)
  local t = node:type()

  if identifier_types[t] then
    local text = node_text(bufnr, node)
    local var_type = vars[text]

    if var_type then
      local sr, sc, er, ec = node:range()

      table.insert(out, {
        name = text,
        var_type = var_type,
        row = sr,
        col = sc,
        end_row = er,
        end_col = ec,
      })
    end
  end

  for child in node:iter_children() do
    walk(bufnr, child, vars, out)
  end
end

function M.find_identifier_references(bufnr, root, vars)
  local out = {}
  walk(bufnr, root, vars, out)
  return out
end

return M
