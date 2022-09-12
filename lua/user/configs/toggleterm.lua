import("toggleterm", function(toggleterm)
  toggleterm.setup({
    shade_terminals = true,
    size = 13,
    direction = "horizontal",
    float_opts = {
      border = "double",
      windblend = 12,
    },
  })

  local Terminal = require("toggleterm.terminal").Terminal
  local lazygit = Terminal:new({
    cmd = "lazygit",
    hidden = true,
    close_on_exit = true,
    direction = "float",
    float_opts = {
      border = "double",
      windblend = 12,
    },
    on_open = function(_)
      vim.keymap.del("t", "<esc>", { buffer = 0 })
    end,
  })

  function ToggleLazygit()
    lazygit:toggle()
  end
end)
