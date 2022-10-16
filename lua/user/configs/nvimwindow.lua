import("nvim-window", function(window)
  local map = require("user.utils").map
  window.setup({
    chars = vim.split("asdfghjkl;qwertyuiop", ""),
    normal_hl = "WinSelect",
    border = "none",
  })

  map("n", [[<A-w>]], function()
    window.pick()
  end)
end)
