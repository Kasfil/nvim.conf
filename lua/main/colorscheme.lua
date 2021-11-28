local gh_theme = require("github-theme")
local colors = require("github-theme.colors").setup()

local M = {}
local custom_hl = {
    -- lightspeed
    LightspeedLabel = { fg = colors.blue, style = "bold" },
    LightspeedLabelOverlapped = { fg = colors.cyan, style = "bold,underline" },
    LightspeedLabelDistant = { fg = colors.orange, style = "bold" },
    LightspeedLabelDistantOverlapped = { fg = colors.yellow, style = "bold,underline" },
    LightspeedShortcut = { fg = colors.blue, style = "bold" },
    LightspeedShortcutOverlapped = { fg = colors.bright_red, style = "bold,underline" },
    LightspeedMaskedChar = { fg = colors.bright_cyan, bg = colors.colors2_gui, style = "bold" },
    LightspeedGreyWash = { fg = colors.syntax.comment },
    LightspeedUnlabeledMatch = { fg = colors.yellow, bg = colors.bg2 },
    LightspeedOneCharMatch = { fg = colors.cyan, style = "bold,reverse" },
    LightspeedUniqueChar = { style = "bold,underline" },
}

local config = {
    theme_style = "dark",
    sidebars = {"NvimTree", "Outline", "packer", "toggleterm"},
    hide_end_of_buffer = true,
    hide_inactive_statusline = false,
    comment_style = "italic"
}

M.apply = function ()
    gh_theme.setup(config)

    -- apply custom highlight
    for group, color in pairs(custom_hl) do
        local style = color.style and "gui=" .. color.style or "gui=NONE"
        local fg = color.fg and "guifg=" .. color.fg or "guifg=NONE"
        local bg = color.bg and "guibg=" .. color.bg or "guibg=NONE"
        local sp = color.sp and "guisp=" .. color.sp or ""

        local hl = "highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp
        vim.cmd(hl)
    end
end

return M
