local map = require("user.utils").map

vim.opt.expandtab = false

map("n", "<leader>dtm", function()
  require("dap-go").debug_test()
end)
