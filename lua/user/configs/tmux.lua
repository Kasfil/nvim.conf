require("tmux").setup({
    copy_sync = {
        enable = false,
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
