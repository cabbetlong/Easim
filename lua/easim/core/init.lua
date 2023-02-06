local M = {}

local defaults = {}

local options

function M.setup(opts)
  options = vim.tbl_deep_extend("force", defaults, opts or {})

  vim.pretty_print(options)
end

M.did_init = false
function M.init()
  if not M.did_init then
    M.did_init = true
    -- require("easim.config").load("options")
  end
end

setmetatable(M, {
  __index = function(_, key)
    if options == nil then
      return vim.deepcopy(defaults)[key]
    end

    return options[key]
  end,
})

return M
