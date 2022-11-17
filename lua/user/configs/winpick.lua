import("window-picker", function(winpick)
  local map = require("user.utils").map

  winpick.setup({
    exclude = {
      qf = true,
      NvimTree = true,
      Trouble = true,
    },
  })

  map("n", "<A-w>w", "<CMD>WindowPick<CR>")
  map("n", "<A-w>s", "<CMD>WindowSwap<CR>")
  map("n", "<A-w>q", "<CMD>WindowZap<CR>")
end)
