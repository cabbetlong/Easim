local M = {
  "echasnovski/mini.base16",
  lazy = false,
  priority = 999,
  opts = {
    colorscheme = "gruvbox",
    background = "dark",
  },
}

function M.config(_, opts)
  vim.opt.background = opts.background
  vim.cmd("colorscheme " .. opts.colorscheme)
end

return M
