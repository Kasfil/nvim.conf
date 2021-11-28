local colors = require("github-theme.colors").setup()
local util = require("github-theme.util")

local tint_lualine_group = function(color)
    local group = {
        a = {bg = color, fg = colors.bg},
        b = {bg = util.darken(color, 0.2), fg = util.lighten(color, 0.2)}
    }
    if vim.o.background == "dark" then
        group.c = {
            bg = util.darken(color, 0.01, colors.bg2),
            fg = util.lighten(color, 0.4, colors.fg)
        }
    else
        -- inverting colors for light colorschemes
        group.c = {
            bg = util.lighten(color, 0.01, colors.bg2),
            fg = util.darken(color, 0.4, colors.fg)
        }
    end
    return group
end

return {
    normal = tint_lualine_group(colors.blue),
    insert = tint_lualine_group(colors.green),
    command = tint_lualine_group(colors.bright_magenta),
    visual = tint_lualine_group(colors.yellow),
    replace = tint_lualine_group(colors.red),
    inactive = {
        a = {bg = colors.bg2, fg = colors.fg_nc_statusline},
        b = {bg = colors.bg2, fg = colors.fg_nc_statusline},
        c = {bg = colors.bg2, fg = colors.fg_nc_statusline}
    }
}
