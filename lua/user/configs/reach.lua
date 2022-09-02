import("reach", function(reach)
  local map = require("user.utils").map

  reach.setup()
  local options = {
    force_delete = { "terminal" },
    auto_handles = { "a", "s", "d", "f", "g", "h", "j", "k", "l" },
  }

  map("n", "<leader>fb", function()
    reach.buffers(options)
  end)
end)
