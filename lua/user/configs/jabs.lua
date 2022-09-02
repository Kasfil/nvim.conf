import("jabs", function(jabs)
  local map = require("user.utils").map

  jabs.setup({
    position = "corner",
    border = "double",
    offset = {
      top = 10,
      bottom = 10,
      left = 10,
      right = 10,
    },
    keymap = {
      close = "x",
      preview = "p",
    },
  })

  map("n", "<leader>fb", ":JABSOpen<CR>")
end)
