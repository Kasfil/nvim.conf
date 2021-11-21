require"lualine".setup {
    options = {
        icons_enabled = true,
        theme = "github",
        disabled_filetypes = {"NvimTree", "packer", "Outline", "toggleterm"}
    },
    sections = {
        lualine_a = {"mode"},
        lualine_b = {
            {
                "branch",
                icon = " "
            },
        },
        lualine_c = {
            "filename",
            {
                "diff",
                colored = true,
                symbols = {added = "+", modified = "~", removed = "-"},
            }
        },
        lualine_x = {
            {
                "diagnostics",
                sources = {"nvim_lsp"},
                sections = {"error", "warn", "info", "hint"}
            },
            {
                "fileformat",
                icons_enabled = false
            },
            "filetype"
        },
        lualine_y = {"progress"},
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
    extensions = {}
}
