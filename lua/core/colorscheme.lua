local colors = require("kanagawa.colors").setup()

require('kanagawa').setup({
    undercurl = true,
    commentStyle = "italic",
    functionStyle = "NONE",
    keywordStyle = "italic",
    statementStyle = "bold",
    typeStyle = "NONE",
    variablebuiltinStyle = "italic",
    specialReturn = true,
    specialException = true,
    dimInactive = true,
    colors = {},
    overrides = {},
})

local M = {}

local custom_hl = {
    -- Telescope
    TelescopePromptNormal = {bg = colors.sumiInk3},
    TelescopePromptBorder = {bg = colors.sumiInk3, fg = colors.sumiInk3},
    TelescopePromptTitle = {bg = colors.crystalBlue, fg = colors.sumiInk1},
    TelescopePromptPrefix = {fg = colors.crystalBlue, bg = colors.sumiInk3},

    TelescopeResultsNormal = {bg = colors.sumiInk1},
    TelescopeResultsBorder = {bg = colors.sumiInk1, fg = colors.sumiInk1},
    TelescopeResultsTitle = {bg = colors.springGreen, fg = colors.sumiInk1},

    TelescopePreviewNormal = {bg = colors.sumiInk1},
    TelescopePreviewBorder = {bg = colors.sumiInk1, fg = colors.sumiInk1},
    TelescopePreviewTitle = {bg = colors.carpYellow, fg = colors.sumiInk1},

    TelescopeSelection = {bg = colors.sumiInk3},

    -- Lightspeed
    LightspeedLabel = {fg = colors.sumiInk1, bg = colors.oniViolet},
    LightspeedLabelOverlapped = {fg = colors.sumiInk1, bg = colors.autumnRed},
    LightspeedShortcut = {fg = colors.sumiInk1, bg = colors.oniViolet},
    LightspeedShortcutOverlapped = {fg = colors.sumiInk1, bg = colors.autumnRed},
    LightspeedOneCharMatch = {fg = colors.sumiInk1, bg = colors.autumnRed},
}

M.apply = function ()
    vim.cmd("colorscheme kanagawa")

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
