return {
  {
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
  },

  {
    "hrsh7th/nvim-cmp",
    event = "VeryLazy",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      {
        "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
    },
    opts = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      return {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<CR>"] = nil,
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.confirm({ select = true })
            elseif luasnip.expand_or_locally_jumpable() then
              require("luasnip").expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "nvim_lua" },
          { name = "path" },
        },
      }
    end,
  },

  { "numToStr/Comment.nvim", event = "VeryLazy", config = true },

  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = "BufReadPost",
    -- stylua: ignore
    keys = {
      { "<leader>tc", "<cmd>TodoTrouble<cr>", desc = "Toggle TODO trouble" },
      -- { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      -- { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
    },
    config = true,
  },

  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    keys = {
      { "<Leader>tt", "<CMD>TroubleToggle<CR>", desc = "Toggle toubles" },
    },
    opts = {
      auto_open = false,
      use_diagnostic_signs = true, -- en
    },
  },

  {
    "stevearc/aerial.nvim",
    cmd = { "AerialToggle" },
    keys = {
      { "<Leader>ta", "<CMD>AerialToggle<CR>", desc = "Toggle aerial" },
    },
    opts = {
      attach_mode = "global",
      backends = { "lsp", "treesitter", "markdown" },
      show_guides = true,
      filter_kind = false,
      icons = {
        Array = "",
        Boolean = "⊨",
        Class = "",
        Constant = "",
        Constructor = "",
        Key = "",
        Function = "",
        Method = "ƒ",
        Namespace = "",
        Null = "NULL",
        Number = "#",
        Object = "⦿",
        Property = "",
        TypeParameter = "𝙏",
        Variable = "",
        Enum = "ℰ",
        Package = "",
        EnumMember = "",
        File = "",
        Module = "",
        Field = "",
        Interface = "ﰮ",
        String = "𝓐",
        Struct = "𝓢",
        Event = "",
        Operator = "+",
      },
      guides = {
        mid_item = "├ ",
        last_item = "└ ",
        nested_top = "│ ",
        whitespace = "  ",
      },
    },
  },
}
