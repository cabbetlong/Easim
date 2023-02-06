return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufReadPost",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  opts = {
    ensure_installed = {
      "vim",
      "html",
      "css",
      "javascript",
      "json",
      "toml",
      "markdown",
      "markdown_inline",
      "c",
      "bash",
      "lua",
      "norg",
      "go",
      "gomod",
      "gowork",
      "yaml",
      "typescript",
      "vue",
      "rust",
      "lua",
      "http",
      "help",
    },
    textobjects = {
      select = {
        enable = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
    },
    highlight = {
      enable = true,
      use_languagetree = true,
    },
    indent = {
      enable = true,
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
