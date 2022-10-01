import("diffview", function(diffview)
  diffview.setup({
    enhanced_diff_view = true,
    hooks = {
      view_opened = function(_)
        vim.opt_local.equalalways = true
      end,
      diff_buf_read = function(bufnr)
        local map = require("user.utils").map
        map("n", "<leader>q", "<CMD>DiffviewClose<CR>", { buffer = bufnr })
      end,
    },
  })
end)
