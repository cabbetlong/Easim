local opts = require("easim.core").keys
local map = require("easim.core.util").map

local function cmd(c)
  return "<cmd>" .. c .. "<cr>"
end

if opts.all then
  if opts.basic then
    map({ "n", "v" }, "<space>", "<nop>", { desc = "Unset space" })
    map("n", "<leader>q", cmd("q"), { desc = "Quit" })
    map("n", "<leader>Q", cmd("q!"), { desc = "Quit forcely" })
    map("n", "<leader>w", cmd("w"), { desc = "Write buffer" })
    map("n", "<ESC>", cmd("noh") .. "<ESC>", { desc = "No highlight" })
    map({ "n", "v" }, "n", "nzz", { desc = "Next word" })
    map({ "n", "v" }, "N", "Nzz", { desc = "Next word" })
    map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, desc = "Move to above line" })
    map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, desc = "Move to below line" })
    map("t", "<ESC>", "<C-\\><C-N>", { desc = "Escape from terminal mode" })
  end

  if opts.easy_motion then
    map("", "H", "_", { desc = "Move to first non-blank of the line easily" })
    map("", "L", "$", { desc = "Move to the end of the line easily" })
    map("", "J", "5j", { desc = "Move down 5 lines" })
    map("", "K", "5k", { desc = "Move up 5 lines" })

    map("n", "<C-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
    map("n", "<C-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
    map("i", "<C-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
    map("i", "<C-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
    map("v", "<C-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
    map("v", "<C-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
  end

  if opts.easy_shift then
    map("n", "<", "<<", { desc = "Shift left" })
    map("n", ">", ">>", { desc = "Shift right" })
    map("v", "<", "<gv", { desc = "Shift left in visual mode" })
    map("v", ">", ">gv", { desc = "Shift right in visual mode" })
  end

  if opts.easy_window then
    map({ "i", "n", "v", "t" }, "<M-h>", "<C-\\><C-N><C-w>h", { desc = "Move cursor to window left of current one" })
    map({ "i", "n", "v", "t" }, "<M-l>", "<C-\\><C-N><C-w>l", { desc = "Move cursor to window right of current one" })
    map({ "i", "n", "v", "t" }, "<M-k>", "<C-\\><C-N><C-w>k", { desc = "Move cursor to window above current one" })
    map({ "i", "n", "v", "t" }, "<M-j>", "<C-\\><C-N><C-w>j", { desc = "Move cursor to window below current one" })
    -- stylua: ignore
    map({ "i", "n", "v", "t" }, "<M-Right>", cmd("vertical resize+5"),
      { desc = "Expand vertical size of current window" })
    -- stylua: ignore
    map({ "i", "n", "v", "t" }, "<M-Left>", cmd("vertical resize-5"), { desc = "Shrink vertical size of current window" })
    map({ "i", "n", "v", "t" }, "<M-Up>", cmd("res +5"), { desc = "Expand horizental size of current window" })
    map({ "i", "n", "v", "t" }, "<M-Down>", cmd("res -5"), { desc = "Shrink horizental size of current window" })
  end
end
