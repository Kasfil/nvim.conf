import("reach", function(reach)
  local map = require("user.utils").map

  reach.setup()
  local options = {
    handle = "dynamic",
    force_delete = { "terminal", "dap-repl" },
    auto_handles = vim.split("asdfghjkl;", ""),
  }

  map("n", "<leader>fb", function()
    reach.buffers(options)
  end)
end)
