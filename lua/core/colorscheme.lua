local palette = require("kanagawa.colors").setup()

require('kanagawa').setup({
    undercurl = true,           -- enable undercurls
    commentStyle = "italic",
    functionStyle = "NONE",
    keywordStyle = "NONE",
    statementStyle = "bold",
    typeStyle = "NONE",
    variablebuiltinStyle = "NONE",
    specialReturn = true,       -- special highlight for the return keyword
    specialException = true,    -- special highlight for exception handling keywords
    transparent = false,        -- do not set background color
    dimInactive = false,        -- dim inactive window `:h hl-NormalNC`
})

local M = {}

local custom_hl = {
    -- normal
    NonText = {fg = palette.sumiInk3},
    CursorLine = {bg = palette.sumiInk2},
    VertSplit = {fg = palette.sumiInk0, style = "bold" },

    -- treesitter
    -- TSComment = {fg = palette.subtle, style = "italic"},

    -- Telescope
    TelescopePromptNormal = {bg = palette.sumiInk3, fg = palette.fujiWhite},
    TelescopePromptBorder = {bg = palette.sumiInk3, fg = palette.sumiInk3},
    TelescopePromptTitle = {bg = palette.springGreen, fg = palette.sumiInk3},
    TelescopePromptPrefix = {fg = palette.springGreen, bg = palette.sumiInk3},
    TelescopePromptCounter = {fg = palette.springGreen},

    TelescopeResultsNormal = {bg = palette.sumiInk0},
    TelescopeResultsBorder = {bg = palette.sumiInk0, fg = palette.sumiInk0},
    TelescopeResultsTitle = {bg = palette.sumiInk0, fg = palette.sumiInk0},

    TelescopePreviewNormal = {bg = palette.sumiInk0},
    TelescopePreviewBorder = {bg = palette.sumiInk0, fg = palette.sumiInk0},
    TelescopePreviewTitle = {bg = palette.carpYellow, fg = palette.sumiInk0},

    TelescopeSelection = {bg = palette.sumiInk3},
    TelescopeSelectionCaret = {fg = palette.waveRed, bg = palette.sumiInk3},

    -- Lightspeed
    LightspeedLabel = {fg = palette.sumiInk0, bg = palette.surimiOrange},
    LightspeedLabelOverlapped = {fg = palette.sumiInk0, bg = palette.waveRed},
    LightspeedShortcut = {fg = palette.sumiInk0, bg = palette.surimiOrange},
    LightspeedShortcutOverlapped = {fg = palette.sumiInk0, bg = palette.waveRed},
    LightspeedOneCharMatch = {fg = palette.sumiInk0, bg = palette.waveRed},

    -- SymbolsOutline
    FocusedSymbol = {bg = palette.sumiInk0, fg = palette.carpYellow},

    -- dap nvim
    DebugPC = {bg = palette.winterRed},

    -- Gitsigns
    GitSignsCurrentLineBlame = {fg = palette.waveBlue2},
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
