require("formatter").setup({
    filetype = {
        python = {
            function()
                return {
                    exe = "isort",
                    args = {"--profile", "black", vim.api.nvim_buf_get_name(0)},
                    stdin = false,
                }
            end,
            function()
                return {
                    exe = "black",
                    args = {"-"},
                    stdin = true,
                }
            end
        },
    },
})


vim.api.nvim_exec([[
augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.py FormatWrite
augroup END
]], true)
