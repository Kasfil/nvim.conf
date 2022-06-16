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
    SideWin = {fg = palette.fujiWhite, bg = palette.sumiInk0},
    -- LineNr = {bg = palette.sumiInk0},

    -- HTML (mostly linked by markdown)
    htmlBoldItalic = {fg = palette.oniViolet, italic = true, bold = true},

    -- virtcolumn
    VirtColumn = {fg = palette.sumiInk2},

    -- nvim-tree
    NvimTreeNormal = {link = "SideWin"},
    NvimTreeNormalNC = {link = "SideWin"},

    -- treesitter
    -- Comment = {fg = palette.fujiGray, italic = true},

    -- Telescope
    TelescopePromptNormal = {bg = palette.autumnGreen, fg = palette.sumiInk3},
    TelescopePromptBorder = {bg = palette.autumnGreen, fg = palette.autumnGreen},
    TelescopePromptTitle = {bg = palette.autumnYellow, fg = palette.sumiInk3},
    TelescopePromptPrefix = {fg = palette.sumiInk3, bg = palette.autumnGreen},
    TelescopePromptCounter = {fg = palette.sumiInk3},

    TelescopeResultsNormal = {bg = palette.sumiInk2},
    TelescopeResultsBorder = {bg = palette.sumiInk2, fg = palette.sumiInk2},
    TelescopeResultsTitle = {bg = palette.sumiInk2, fg = palette.sumiInk2},

    TelescopePreviewNormal = {bg = palette.sumiInk0},
    TelescopePreviewBorder = {bg = palette.sumiInk0, fg = palette.sumiInk0},
    TelescopePreviewTitle = {bg = palette.carpYellow, fg = palette.sumiInk0},

    TelescopeSelection = {bg = palette.sumiInk3},
    TelescopeSelectionCaret = {fg = palette.waveRed, bg = palette.sumiInk3},

    -- Lightspeed
    LeapBackdrop = {fg = palette.fujiGray},

    -- SymbolsOutline
    FocusedSymbol = {bg = "NONE"},

    -- dap nvim
    DebugPC = {bg = palette.winterRed},
    DapStatusLine = {bg = "NONE", fg = palette.roninYellow, bold = true},

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
    FloatTitle = {bg = palette.sumiInk1, fg = palette.autumnYellow, bold = true, italic = true},
}

require("kanagawa").setup({
    commentStyle = { italic = true },
    dimInactive = false,
    globalStatus = true,
    overrides = custom_hl,
    colors = colors,
})

vim.cmd("colorscheme kanagawa")
