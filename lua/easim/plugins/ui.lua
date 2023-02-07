return {
  { "MunifTanjim/nui.nvim" },
  { "kyazdani42/nvim-web-devicons" },

  {
    "stevearc/dressing.nvim",
    init = function()
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,

    opts = {
      input = {
        mappings = {
          n = {
            ["q"] = "Close",
            ["<CR>"] = "Confirm",
          },
          i = {
            ["<Esc>"] = "Close",
            ["<CR>"] = "Confirm",
            ["<Up>"] = "HistoryPrev",
            ["<Down>"] = "HistoryNext",
          },
        },
      },
      select = {
        mappings = {
          ["<Esc>"] = "Close",
          ["q"] = "Close",
          ["<CR>"] = "Confirm",
        },
      },
    },
    config = true,
  },

  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    opts = {
      timeout = 3000,
      level = vim.log.levels.INFO,
      fps = 30,
      stages = "slide",
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
    },
    config = true,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      presets = {
        bottom_search = true,
        command_palette = false,
        long_message_to_split = false,
        inc_rename = false,
        cmdline_output_to_split = false,
      },
    },
    config = true,
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      sections = {
        lualine_a = {
          "mode",
          function()
            local r = vim.fn.reg_recording()
            if r == "" then
              return r
            else
              return "recording @" .. r
            end
          end,
        },
        lualine_b = { "branch", "diagnostics" },
        lualine_c = {
          { "filename", path = 1, symbols = { modified = "", readonly = "" } },
        },
        lualine_x = { "encoding", "filetype" },
        lualine_y = { "filesize" },
        lualine_z = {
          function()
            local cur_row = vim.api.nvim_win_get_cursor(0)[1]
            local total_row = vim.api.nvim_buf_line_count(0)
            return string.format("%.f", cur_row / total_row * 100) .. "%%"
          end,
          "location",
        },
      },
      -- extensions = {"nvim-tree", "aerial", "toggleterm", "quickfix"}
    },
    config = true,
  },
}
