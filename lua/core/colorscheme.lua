local colors = require('rose-pine.palette')

local M = {}

local custom_hl = {
    -- normal
    NonText = {fg = colors.overlay},
    StatusLine = {bg = colors.overlay},
    StatusLineNC = {bg = colors.highlight_low},

    -- treesitter
    TSComment = {fg = colors.subtle, style = "italic"},

    -- Telescope
    TelescopePromptNormal = {bg = colors.overlay, fg = colors.text},
    TelescopePromptBorder = {bg = colors.overlay, fg = colors.overlay},
    TelescopePromptTitle = {bg = colors.iris, fg = colors.overlay},
    TelescopePromptPrefix = {fg = colors.iris, bg = colors.overlay},
    TelescopePromptCounter = {fg = colors.iris},

    TelescopeResultsNormal = {bg = colors.surface},
    TelescopeResultsBorder = {bg = colors.surface, fg = colors.surface},
    TelescopeResultsTitle = {bg = colors.surface, fg = colors.surface},

    TelescopePreviewNormal = {bg = colors.surface},
    TelescopePreviewBorder = {bg = colors.surface, fg = colors.surface},
    TelescopePreviewTitle = {bg = colors.gold, fg = colors.surface},

    TelescopeSelection = {bg = colors.overlay},
    TelescopeSelectionCaret = {fg = colors.love, bg = colors.overlay},

    -- Lightspeed
    LightspeedLabel = {fg = colors.overlay, bg = colors.rose},
    LightspeedLabelOverlapped = {fg = colors.overlay, bg = colors.love},
    LightspeedShortcut = {fg = colors.overlay, bg = colors.rose},
    LightspeedShortcutOverlapped = {fg = colors.overlay, bg = colors.love},
    LightspeedOneCharMatch = {fg = colors.overlay, bg = colors.love},

    -- SymbolsOutline
    FocusedSymbol = {bg = colors.surface, fg = colors.gold}
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
