return {
  {
    "kyazdani42/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    keys = {
      -- stylua: ignore
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
    },

    --   Info  14时13分06秒 notify.info NvimTree view.mappings.list has been deprecated in favour of on_attach. Please run :NvimTreeGenerateOnAttach and visit https://github.com/nvim-tree/nvim-tree.lua/wiki/Migrating-To-on_attach

    opts = function()
      local function on_attach(bufnr)
        local api = require("nvim-tree.api")

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        api.config.mappings.default_on_attach(bufnr)
        vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
        vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
      end

      return {
        on_attach = on_attach,
        filters = {
          dotfiles = true,
        },
        diagnostics = {
          enable = true,
          show_on_dirs = true,
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
          root_folder_label = false,
          indent_markers = {
            enable = false,
          },
        },
      }
    end,
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
      { "<Leader>fk", "<CMD>Telescope keymaps<CR>", desc = "Find keymaps" },
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
