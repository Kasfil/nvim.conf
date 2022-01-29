local colors = require('rose-pine.palette')

local M = {}

local custom_hl = {
    -- normal
    NonText = {fg = colors.overlay},

    -- treesitter
    TSComment = {fg = colors.subtle, style = "italic"},

    -- Telescope
    TelescopePromptNormal = {bg = colors.muted, fg = colors.text},
    TelescopePromptBorder = {bg = colors.muted, fg = colors.muted},
    TelescopePromptTitle = {bg = colors.iris, fg = colors.base},
    TelescopePromptPrefix = {fg = colors.iris, bg = colors.muted},
    TelescopePromptCounter = {fg = colors.iris},

    TelescopeResultsNormal = {bg = colors.overlay},
    TelescopeResultsBorder = {bg = colors.overlay, fg = colors.overlay},
    TelescopeResultsTitle = {bg = colors.foam, fg = colors.overlay},

    TelescopePreviewNormal = {bg = colors.overlay},
    TelescopePreviewBorder = {bg = colors.overlay, fg = colors.overlay},
    TelescopePreviewTitle = {bg = colors.gold, fg = colors.overlay},

    TelescopeSelection = {bg = colors.base},
    TelescopeSelectionCaret = {fg = colors.love, bg = colors.base},

    -- Lightspeed
    LightspeedLabel = {fg = colors.overlay, bg = colors.rose},
    LightspeedLabelOverlapped = {fg = colors.overlay, bg = colors.love},
    LightspeedShortcut = {fg = colors.overlay, bg = colors.rose},
    LightspeedShortcutOverlapped = {fg = colors.overlay, bg = colors.love},
    LightspeedOneCharMatch = {fg = colors.overlay, bg = colors.love},
}

M.apply = function ()
    vim.g.rose_pine_bold_vertical_split_line = true
    vim.g.rose_pine_disable_italics = true

    vim.cmd("colorscheme rose-pine")

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
