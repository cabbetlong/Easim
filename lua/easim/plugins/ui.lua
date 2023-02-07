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
  },

  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    opts = {
      logo = [[
 _______  _______  _______ _________ _______ 
(  ____ \(  ___  )(  ____ \\__   __/(       )
| (    \/| (   ) || (    \/   ) (   | () () |
| (__    | (___) || (_____    | |   | || || |
|  __)   |  ___  |(_____  )   | |   | |(_)| |
| (      | (   ) |      ) |   | |   | |   | |
| (____/\| )   ( |/\____) |___) (___| )   ( |
(_______/|/     \|\_______)\_______/|/     \|
      ]],

      buttons = {
        { "l", "鈴 Lazy", ":Lazy<CR>" },
        { "s", "  Restore Session", ":RestoreSession<CR>" },
        { "c", "  Config", ":e $MYVIMRC <CR>" },
        { "q", "  Quit", ":qa<CR>" },
      },
    },
    config = function(_, opts)
      local dashboard = require("alpha.themes.dashboard")

      local logo = opts.logo
      dashboard.section.header.val = vim.split(logo, "\n")

      local buttons = {}
      for _, button in ipairs(opts.buttons) do
        vim.list_extend(buttons, { dashboard.button(button[1], button[2], button[3]) })
      end
      dashboard.section.buttons.val = buttons
      dashboard.opts.layout[1].val = 8
      vim.b.miniindentscope_disable = true

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "AlphaReady",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      require("alpha").setup(dashboard.opts)
      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.loaded .. " plugins in " .. ms .. "ms"
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },
}
