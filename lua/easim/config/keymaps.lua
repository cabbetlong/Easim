local opts = require("easim.core").keys

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

local function cmd(c)
  return "<cmd>" .. c .. "<cr>"
end

return function()
  if not opts.all then
    return
  end

  if opts.basic then
    -- Space as leader
    map({ "n", "v" }, "<space>", "<nop>", { desc = "Unset space" })

    map("n", "<leader>q", cmd("q"), { desc = "Quit" })
    map("n", "<leader>Q", cmd("q!"), { desc = "Quit forcely" })
    map("n", "<leader>w", cmd("w"), { desc = "Write buffer" })

    -- search
    map("n", "<esc>", cmd("noh"), { desc = "No hilight" })
  end
end
