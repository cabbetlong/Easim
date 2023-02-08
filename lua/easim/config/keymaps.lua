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

if opts.all then
  if opts.basic then
    map({ "n", "v" }, "<space>", "<nop>", { desc = "Unset space" })
    map("n", "<leader>q", cmd("q"), { desc = "Quit" })
    map("n", "<leader>Q", cmd("q!"), { desc = "Quit forcely" })
    map("n", "<leader>w", cmd("w"), { desc = "Write buffer" })
    map({ "n", "v" }, "n", "nzz", { desc = "Next word" })
    map({ "n", "v" }, "N", "Nzz", { desc = "Next word" })
  end

  if opts.easy_motion then
    map("", "H", "_", { desc = "Move to first non-blank of the line easily" })
    map("", "L", "$", { desc = "Move to the end of the line easily" })
    map("", "J", "5j", { desc = "Move down 5 lines" })
    map("", "K", "5k", { desc = "Move up 5 lines" })
  end
end
