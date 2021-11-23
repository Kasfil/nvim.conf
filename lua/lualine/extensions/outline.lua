local M = {}

M.sections = {
    lualine_y = { function() return "Outline" end }
}

M.inactive_sections = {
    lualine_y = { function() return "Outline" end }
}

M.filetypes = { "Outline" }

return M
