import("notify", function(notify)
  notify.setup({
    background_colour = "#24273A",
    timeout = 500,
  })

  vim.notify = notify
end)
