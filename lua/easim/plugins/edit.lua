return {
  {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    config = function()
      require("nvim-autopairs").setup()
      -- If you want insert `(` after select function or method item
      require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
    end,
  },

  {
    "kylechui/nvim-surround",
    event = "BufReadPost",
    opts = { keymaps = { visual = "<C-s>" } },
    config = true,
  },

  {
    "tpope/vim-sleuth",
    event = "VeryLazy",
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    opts = {
      char = "│",
      filetype_exclude = { "help", "alpha", "dashboard", "NvimTree", "Trouble", "lazy" },
      show_trailing_blankline_indent = false,
      show_current_context = false,
    },
    config = true,
  },

  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPost",
    config = true,
  },

  {
    "andymass/vim-matchup",
    event = "BufReadPost",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "status_manual" }
    end,
  },

  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    dependencies = {
      { "ggandor/flit.nvim", opts = { labeled_modes = "nv" } },
    },
    config = function(_, opts)
      local leap = require("leap")
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
    end,
  },

  { "tpope/vim-repeat", event = "VeryLazy" },

  {
    "nacro90/numb.nvim",
    event = "VeryLazy",
    config = true,
  },

  {
    "rmagatti/auto-session",
    event = "BufReadPre",
    opts = {
      log_level = "error",
      auto_session_suppress_dirs = { "~", "~/*" },
    },
    cmd = { "RestoreSession" },
    keys = {
      { "<leader>ss", "<CMD>RestoreSession<CR>", desc = "Restore Session" },
      { "<leader>sd", "<CMD>DeleteSession<CR>", desc = "Delete Current Session" },
    },
    config = true,
  },

  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    keys = {
      { "<M-=>", "<CMD>ToggleTerm<CR>", desc = "Toggle terminal" },
    },
    opts = {
      size = 15,
      open_mapping = "<M-=>",
      direction = "horizontal",
      autochdir = true,
      close_on_exit = true,
      float_opts = {
        border = "curved",
      },
    },
    config = true,
  },
}
