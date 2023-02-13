return {
  {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      "williamboman/mason.nvim",
      { "williamboman/mason-lspconfig.nvim" },
      { "folke/neodev.nvim", config = true },
    },
    opts = {
      auto_format_on_save = true,
      servers = {
        lua_ls = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = { globals = { "vim" } },
          },
        },
      },
    },
    config = function(_, opts)
      local on_attach = function(_, bufnr)
        -- Create a command `:Format` local to the LSP buffer
        vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
          vim.lsp.buf.format()
        end, { desc = "Format current buffer with LSP" })

        -- Format before save buffer
        if opts.auto_format_on_save then
          vim.api.nvim_create_autocmd("BufWritePre", {
            desc = "Auto format before save file",
            buffer = bufnr,
            callback = function()
              if vim.fn.getbufinfo("%")[1].changed == 0 then
                return
              end

              vim.lsp.buf.format()
            end,
          })
        end

        local map = function(mode, lhs, rhs, options)
          local keys = require("lazy.core.handler").handlers.keys
          if not keys.active[keys.parse({ lhs, mode = mode }).id] then
            opts = opts or {}
            opts.silent = opts.silent ~= false
            opts.buffer = bufnr
            vim.keymap.set(mode, lhs, rhs, options)
          end

          vim.keymap.set(mode, lhs, rhs, options)
        end
        map("n", "gd", require("telescope.builtin").lsp_definitions, { desc = "Goto definition" })
        map("n", "gr", "<cmd>Glance references<cr>", { desc = "Goto references" })
        map("n", "gi", "<cmd>Glance implementations<cr>", { desc = "Goto implementations" })
        map("n", "gn", vim.lsp.buf.rename, { desc = "LSP rename" })
        map("n", "gca", vim.lsp.buf.code_action, { desc = "LSP code action" })
        map("n", "gk", vim.lsp.buf.hover, { desc = "LSP code action" })
        map("n", "gK", vim.lsp.buf.signature_help, { desc = "Signature documentation" })

        map("n", "[d", vim.diagnostic.goto_prev, { desc = "Goto previous diagnostic" })
        map("n", "]d", vim.diagnostic.goto_next, { desc = "Goto next diagnostic" })
      end
      -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

      local servers = opts.servers
      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
          on_attach = on_attach,
          settings = servers[server],
        }, servers[server] or {})

        require("lspconfig")[server].setup(server_opts)
      end

      local mlsp = require("mason-lspconfig")
      local available = mlsp.get_available_servers()
      local ensure_installed = {} ---@type string[]
      for server, server_opts in pairs(servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
          if server_opts.mason == false or not vim.tbl_contains(available, server) then
            setup(server)
          else
            ensure_installed[#ensure_installed + 1] = server
          end
        end
      end

      mlsp.setup({ ensure_installed = ensure_installed })
      mlsp.setup_handlers({ setup })
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        debounce = 150,
        save_after_format = false,
        sources = {
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.shfmt, -- shell
          -- python
          nls.builtins.formatting.prettier.with({ filetypes = { "html", "markdown", "css", "json", "yaml" } }),
          nls.builtins.formatting.black,
          nls.builtins.diagnostics.flake8,
        },
      }
    end,
  },

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
        "vim-language-server",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end,
  },

  {
    "DNLHC/glance.nvim",
    event = "BufReadPre",
    opts = {
      list = {
        position = "left",
      },
      folds = {
        folded = false,
      },
    },
  },
}
