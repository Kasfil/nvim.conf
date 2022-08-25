import("indent_blankline", function(indent)
  indent.setup({
    use_treesitter = true,
    show_first_indent_level = true,
    max_indent_increase = 1,
    show_current_context = true,
    show_trailing_blankline_indent = true,
    char_highlight_list = { "NonText" },
    buftype_exclude = { "terminal", "nofile" },
    filetype_exclude = { "NvimTree", "packer", "help", "lspinfo", "sagahover", "ImportManager" },
  })
end)
