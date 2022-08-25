local user_cmd = vim.api.nvim_create_user_command

user_cmd(
    "Uuid",
    [[exe "norm! a".system('uuidgen | tr "[:upper:]" "[:lower:]" | tr -d "\n"')]],
    {}
)
