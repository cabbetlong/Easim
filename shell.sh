mkdir -vp ~/.config/nvim/
mkdir -vp ~/.config/nvim/lua/plugins
mkdir -vp ~/.config/nvim/lua/config

echo 'return {}' > ~/.config/nvim/lua/plugins/init.lua

echo '-- lazy.nvim to manage plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.pretty_print("Cloning lazy.nvim\nPlease wait...\n")

  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
  spec = {
    { "cabbetlong/Easim", import = "easim.plugins" },
    { import = "plugins" }, -- local plugins directory
  },
  defaults = { lazy = true },
  checker = { enabled = false },
  diff = {
    cmd = "terminal_git",
  },
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = false,
    notify = false, -- get a notification when changes are found
  },
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})' > ~/.config/nvim/init.lua
