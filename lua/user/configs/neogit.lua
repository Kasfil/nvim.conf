import("neogit", function(neogit)
  neogit.setup({
    signs = {
      section = { "", "" },
      item = { "", "" },
      hunk = { "-", "+" },
    },
    integrations = {
      diffview = true,
    },
  })
end)
