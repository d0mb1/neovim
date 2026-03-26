local M = {}

local function node_text(bufnr, node)
  return vim.treesitter.get_node_text(node, bufnr)
end

local function get_type_from_node(bufnr, node)
  if not node then
    return nil
  end

  local t = node:type()

  if t == "number" or t == "integer" or t == "float" or t == "number_literal" then
    return "number"
  end

  if t == "string" or t == "string_literal" or t == "template_string" or t == "interpreted_string_literal" then
    return "string"
  end

  if t == "true" or t == "false" or t == "true_literal" or t == "false_literal" then
    return "boolean"
  end

  local text = node_text(bufnr, node)

  if text == "true" or text == "false" then
    return "boolean"
  end

  if text:match('^".*"$') or text:match("^'.*'$") then
    return "string"
  end

  if text:match("^%-?%d+%.?%d*$") then
    return "number"
  end

  return nil
end

local function add_var(vars, name, var_type)
  if not name or name == "" or not var_type then
    return
  end

  vars[name] = var_type
end

local function handle_lua(bufnr, root, vars)
  for node in root:iter_children() do
    local t = node:type()

    if t == "local_variable_declaration" then
      local name_node = node:field("name")[1]
      local value_node = node:field("value")[1]

      if name_node and value_node then
        add_var(vars, node_text(bufnr, name_node), get_type_from_node(bufnr, value_node))
      end
    end

    handle_lua(bufnr, node, vars)
  end
end

local function handle_js_like(bufnr, root, vars)
  for node in root:iter_children() do
    local t = node:type()

    if t == "variable_declarator" then
      local name_node = node:field("name")[1]
      local value_node = node:field("value")[1]

      if name_node and value_node and name_node:type() == "identifier" then
        add_var(vars, node_text(bufnr, name_node), get_type_from_node(bufnr, value_node))
      end
    end

    handle_js_like(bufnr, node, vars)
  end
end

local function handle_python(bufnr, root, vars)
  for node in root:iter_children() do
    local t = node:type()

    if t == "assignment" then
      local left = node:field("left")[1]
      local right = node:field("right")[1]

      if left and right and left:type() == "identifier" then
        add_var(vars, node_text(bufnr, left), get_type_from_node(bufnr, right))
      end
    end

    handle_python(bufnr, node, vars)
  end
end

function M.collect_typed_variables(bufnr, root)
  local ft = vim.bo[bufnr].filetype
  local vars = {}

  if ft == "lua" then
    handle_lua(bufnr, root, vars)
  elseif ft == "javascript" or ft == "typescript" or ft == "javascriptreact" or ft == "typescriptreact" then
    handle_js_like(bufnr, root, vars)
  elseif ft == "python" then
    handle_python(bufnr, root, vars)
  end

  return vars
end

return M
