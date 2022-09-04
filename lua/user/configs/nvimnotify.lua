import("notify", function(notify)
  notify.setup({
    timeout = 750,
  })

  vim.notify = notify
end)
