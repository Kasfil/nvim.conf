local map = require("user.utils").map

map("n", "<leader>dtm", function()
  require("dap-go").debug_test()
end)
