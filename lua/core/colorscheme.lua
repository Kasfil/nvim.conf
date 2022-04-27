local palette = require("kanagawa.colors").setup()

local colors = {
    lightgreen = "#7ae582",
    lightblue = "#77aaff",
}

local custom_hl = {
    -- normal
    NonText = {fg = palette.sumiInk3},
    CursorLine = {bg = palette.sumiInk2},
    WinSeparator = {fg = palette.sumiInk4},
    -- LineNr = {bg = palette.sumiInk0},

    -- HTML (mostly linked by markdown)
    htmlBoldItalic = {fg = palette.oniViolet, style = "bold,italic"},

    -- virtcolumn
    VirtColumn = {fg = palette.sumiInk2},

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
    LeapBackdrop = {fg = palette.fujiGray},
    -- LightspeedLabel = {fg = palette.sumiInk2, bg = colors.lightgreen},
    -- LightspeedLabelOverlapped = {fg = palette.sumiInk2, bg = colors.lightblue},
    -- LightspeedShortcut = {link = "LightspeedLabel"},
    -- LightspeedShortcutOverlapped = {link = "LightspeedLabelOverlapped"},
    -- LightspeedOneCharMatch = {link = "LightspeedLabel"},
    -- LightspeedUniqueChar = {fg = palette.sumiInk2, bg = palette.surimiOrange},

    -- SymbolsOutline
    FocusedSymbol = {bg = palette.sumiInk0, fg = palette.carpYellow},

    -- dap nvim
    DebugPC = {bg = palette.winterRed},
    DapStatusLine = {bg = "NONE", fg = palette.roninYellow, style = "bold"},

    -- Gitsigns
    GitSignsCurrentLineBlame = {fg = palette.waveBlue2},

    -- neogit
    NeogitNotificationInfo = {fg = palette.springBlue},
    NeogitNotificationWarning = {fg = palette.carpYellow},
    NeogitNotificationError = {fg = palette.peachRed},

    -- bqf
    BqfPreviewBorder = {fg = palette.springGreen, bg = palette.sumiInk0},
    BqfPreviewFloat = {bg = palette.sumiInk0},

    -- dressing
    DressingInput = {bg = palette.sumiInk1, fg = palette.fujiWhite},
    DressingBorder = {bg = palette.sumiInk1, fg = palette.autumnYellow},
    FloatTitle = {bg = palette.sumiInk1, fg = palette.autumnYellow, style = "bold,italic"},
}

require("kanagawa").setup({
    dimInactive = false,
    globalStatus = true,
    overrides = custom_hl,
    colors = colors,
})

vim.cmd("colorscheme kanagawa")
