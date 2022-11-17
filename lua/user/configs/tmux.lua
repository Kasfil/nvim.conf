import("tmux", function(tmux)
  tmux.setup({
    copy_sync = {
      enable = true,
    },
    navigation = {
      enable_default_keybindings = true,
    },
    resize = {
      enable_default_keybindings = true,
      resize_step_x = 3,
      resize_step_y = 3,
    },
  })
end)
