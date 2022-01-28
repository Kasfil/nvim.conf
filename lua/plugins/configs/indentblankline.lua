require("indent_blankline").setup({
    use_treesitter = true,
    buftype_exclude = {"terminal", "nofile"},
    filetype_exclude = {"NvimTree", "packer", "help", "lspinfo", "sagahover"}
})
