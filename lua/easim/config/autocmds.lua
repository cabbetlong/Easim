local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

augroup("auto_reload_file", {})
autocmd("CursorHold,CursorHoldI", {
  desc = "Reload file automatically",
  group = "auto_reload_file",
  pattern = "*",
  command = "checktime",
})

autocmd("BufEnter", {
  desc = "Don't auto commenting new lines",
  pattern = "*",
  command = "set fo-=c fo-=r fo-=o",
})

autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  callback = function()
    vim.highlight.on_yank({ higroup = "Incsearch", timeout = 150 })
  end,
})
