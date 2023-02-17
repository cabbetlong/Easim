return {
  "nvim-lua/plenary.nvim",

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      local keymaps = {
        mode = { "n", "v" },
        ["g"] = { name = "+goto&lsp" },
        ["ys"] = { name = "+surround" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader><tab>"] = { name = "+tabs" },
        ["<leader>f"] = { name = "+file/find" },
        ["<leader>q"] = { name = "+quit/session" },
        ["<leader>t"] = { name = "+toggle" },
      }
      wk.register(keymaps)
    end,
  },

  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 20
    end,
  },
}
