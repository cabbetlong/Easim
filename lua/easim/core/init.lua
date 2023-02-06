local M = {}

local defaults = {
  theme = {
    colorscheme = "gruvbox",
    background = "dark",
  },
}

local options

function M.setup(opts)
  options = vim.tbl_deep_extend("force", defaults, opts or {})

  require("lazy.core.util").try(function()
    if type(M.colorscheme) == "function" then
      M.colorscheme()
    else
      vim.opt.background = "dark"
      vim.cmd.colorscheme(M.colorscheme)
    end
  end, {
    msg = "Could not load your colorscheme",
    on_error = function(msg)
      require("lazy.core.util").error(msg)
      vim.opt.background = "dark"
      vim.cmd.colorscheme("habamax")
    end,
  })
end

M.did_init = false
function M.init()
  if not M.did_init then
    M.did_init = true
    require("easim.config.options")
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
