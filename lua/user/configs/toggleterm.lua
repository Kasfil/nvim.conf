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
end)
