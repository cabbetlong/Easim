return {
  {
    "kyazdani42/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    keys = {
      -- stylua: ignore
      { "<leader>e", function() require("nvim-tree").toggle() end, desc = "Toggle NvimTree" },
    },
    opts = {
      filters = {
        dotfiles = true,
      },
      diagnostics = {
        enable = true,
      },
      disable_netrw = true,
      hijack_netrw = true,
      hijack_cursor = true,
      hijack_unnamed_buffer_when_opening = false,
      update_cwd = true,
      update_focused_file = {
        enable = true,
        update_cwd = false,
      },
      view = {
        adaptive_size = true,
        side = "left",
        width = 30,
        hide_root_folder = true,
        mappings = {
          list = {
            { key = { "<CR>", "l", "<2-LeftMouse>" }, action = "edit" },
            { key = { "<BS>", "h" }, action = "close_node" },
          },
        },
      },
      git = {
        enable = true,
        ignore = true,
      },
      filesystem_watchers = {
        enable = true,
      },
      actions = {
        open_file = {
          resize_window = true,
        },
      },
      renderer = {
        highlight_git = false,
        highlight_opened_files = "none",
        indent_markers = {
          enable = false,
        },
      },
    },
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
  },

  {
    "nvim-telescope/telescope.nvim",
    cmd = { "Telescope" },
    -- stylua: ignore
    keys = {
      { "<Leader>ff", "<CMD>Telescope find_files<CR>", desc = "Find files" },
      { "<Leader>fg", "<CMD>Telescope live_grep<CR>", desc = "Find live grep" },
      { "<Leader>fb", "<CMD>Telescope buffers<CR>", desc = "Find buffers" },
      { "<Leader>fh", "<CMD>Telescope help_tags<CR>", desc = "Find help tags" },
      { "<Leader>fs", "<CMD>Telescope symbols<CR>", desc = "Find symbols" },
      { "<Leader>fc", "<CMD>Telescope commands<CR>", desc = "Find commands" },
      { "<Leader>ft", "<CMD>Telescope colorscheme<CR>", desc = "Find colorscheme" },
    },
    opts = {
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
      },
    },
  },
}
