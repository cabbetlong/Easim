return function()
  local keys = require("easim.core").keys
  if not keys.all then
    return
  end

  if keys.basic then
    vim.keymap.set("n", "<leader>q", "<cmd>qa<cr>")
  end
end
