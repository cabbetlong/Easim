local M = {}

local defaults = {
  theme = {
    colorscheme = "gruvbox",
    background = "dark",
    dynamic_theme = false,
    dynamic = {
      { from = "07:00", to = "19:00", background = "light", colorscheme = "gruvbox" },
      { from = "19:00", to = "24:00", background = "dark", colorscheme = "gruvbox" },
      { from = "00:00", to = "07:00", background = "dark", colorscheme = "gruvbox" },
    },
  },
  keys = {
    all = true,
    basic = true,
    easy_motion = true,
    easy_shift = true,
    easy_window = true,
    toggle = true,
  },
}

local options

function M.require(pkg)
  local _, ok = pcall(require, pkg)
  if not ok then
    vim.notify(pkg .. "loaded failed!", vim.log.levels.ERROR)
  end
end

function M.setup(opts)
  options = vim.tbl_deep_extend("force", defaults, opts or {})

  if vim.fn.argc(-1) == 0 then
    vim.api.nvim_create_autocmd("User", {
      group = vim.api.nvim_create_augroup("Easim", { clear = true }),
      pattern = "VeryLazy",
      callback = function()
        M.require("easim.config.autocmds")
        M.require("config.autocmds")
        M.require("easim.config.keymaps")
        M.require("config.keymaps")
      end,
    })
  else
    M.require("easim.config.autocmds")
    M.require("config.autocmds")
    M.require("easim.config.keymaps")
    M.require("config.keymaps")
  end

  require("lazy.core.util").try(function()
    if type(M.theme) == "function" then
      M.theme()
    else
      if M.theme.dynamic_theme == true then
        local now = os.date("%H:%M")
        local between = function(from, to)
          return now >= from and now < to
        end

        for _, value in ipairs(M.theme.dynamic) do
          if between(value.from, value.to) then
            vim.opt.background = value.background
            vim.cmd.colorscheme(value.colorscheme)
            return
          end
        end
      end

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
    M.require("easim.config.options")
    M.require("config.options")
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
