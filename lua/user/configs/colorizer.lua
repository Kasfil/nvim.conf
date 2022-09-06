import("colorizer", function(colorizer)
  colorizer.setup({
    filetypes = { "css", "lua" },
    user_default_options = {
      names = false,
      mode = "background",
    },
  })
end)
