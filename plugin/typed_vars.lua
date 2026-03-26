vim.api.nvim_create_user_command("TypedVarsEnable", function()
  require("typed_vars").enable()
end, {})

vim.api.nvim_create_user_command("TypedVarsDisable", function()
  require("typed_vars").disable()
end, {})
