local M = {}

local defaults = {}

function M.setup(opts)
  local options = vim.tbl_deep_extend("force", defaults, opts or {})

  vim.pretty_print(options)
end

return M
