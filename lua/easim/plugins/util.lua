return {
  "nvim-lua/plenary.nvim",

  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 20
    end,
  },
}
