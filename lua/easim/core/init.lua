local M = {}

local defaults = {
  theme = {
    colorscheme = "gruvbox",
    background = "dark",
  },
  keys = {
    all = true,
    basic = true,
    easy_motion = true,
    easy_indent = true,
    easy_window = true,
    toggle = true,
  },
}

local options

function M.setup(opts)
  options = vim.tbl_deep_extend("force", defaults, opts or {})

  if vim.fn.argc(-1) == 0 then
    vim.api.nvim_create_autocmd("User", {
      group = vim.api.nvim_create_augroup("Easim", { clear = true }),
      pattern = "VeryLazy",
      callback = function()
        require("easim.config.autocmds")
      end,
    })
  else
    require("easim.config.autocmds")
  end

  require("lazy.core.util").try(function()
    if type(M.theme) == "function" then
      M.theme()
    else
      vim.opt.background = M.theme.background
      vim.cmd.colorscheme(M.theme.colorscheme)
    end
  end, {
    msg = "Could not load your colorscheme",
    on_error = function(msg)
      require("lazy.core.util").error(msg)
      vim.opt.background = "dark"
      vim.cmd.colorscheme("gruvbox")
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
