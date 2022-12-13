import("dressing", function(dressing)
  dressing.setup({
    input = {
      border = "single",
      win_options = {
        winblend = 12,
        winhighlight = "NormalFloat:DressingInput,FloatBorder:DressingBorder",
      },

      get_config = function()
        if vim.api.nvim_buf_get_option(0, "filetype") == "NvimTree" then
          return { enabled = false }
        end
      end,
    },
  })
end)
