import("lspsaga", function(saga)
  local map = require("user.utils").map
  saga.init_lsp_saga({
    code_action_icon = " ",
  })

  map("n", "K", "<cmd>Lspsaga hover_doc<CR>")
end)
