require"lualine".setup {
    options = {
        icons_enabled = true,
        theme = "kanagawa",
        section_separators = {left = "", right = ""},
        component_separators = {left = "", right = ""},
        disabled_filetypes = {"packer", "toggleterm"}
    },
    sections = {
        lualine_a = {"mode"},
        lualine_b = {},
        lualine_c = {
            {
                "filename",
                path = 1,
            },
            {
                "diagnostics",
                sources = {"nvim_diagnostic"},
                symbols = {error = "E", warn = "W", info = "I", hint = "H"},
                sections = {"error", "warn", "info", "hint"}
            },
        },
        lualine_x = {
            {"branch", icon = ""},
            {
                "diff",
                colored = true,
                symbols = {
                    added = "+",
                    modified = "~",
                    removed = "-"
                },
            },
            "filetype",
        },
        lualine_y = {},
        lualine_z = {"location"}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {"filename"},
        lualine_x = {"location"},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {"nvim-tree"}
}
