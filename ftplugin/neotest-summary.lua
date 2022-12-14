local map = require("user.utils").map

vim.opt_local.winhighlight = "Normal:SideWin"
vim.opt_local.list = false

map("n", "q", function()
  require("neotest").summary.close()
end)
