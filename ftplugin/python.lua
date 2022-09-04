local map = require("user.utils").map

map("n", "<leader>dtm", function()
  require("dap-python").test_method()
end)
map("n", "<leader>dtc", function()
  require("dap-python").test_class()
end)
