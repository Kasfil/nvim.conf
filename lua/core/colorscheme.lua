vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_sign_column_background = "none"
vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
vim.g.gruvbox_material_diagnostic_text_highlight = 1

local background = vim.opt.background:get()
local configuration = vim.fn["gruvbox_material#get_configuration"]()
local palette = vim.fn["gruvbox_material#get_palette"](background, configuration.palette)

local M = {}

local custom_hl = {
    -- normal
    NonText = {fg = palette.bg2[1]},
    -- StatusLine = {bg = palette.bg_statusline3[1]},
    -- StatusLineNC = {bg = palette.bg1[1]},

    -- treesitter
    -- TSComment = {fg = palette.subtle, style = "italic"},

    -- Telescope
    TelescopePromptNormal = {bg = palette.bg3[1], fg = palette.fg0[1]},
    TelescopePromptBorder = {bg = palette.bg3[1], fg = palette.bg3[1]},
    TelescopePromptTitle = {bg = palette.green[1], fg = palette.bg3[1]},
    TelescopePromptPrefix = {fg = palette.green[1], bg = palette.bg3[1]},
    TelescopePromptCounter = {fg = palette.green[1]},

    TelescopeResultsNormal = {bg = palette.bg1[1]},
    TelescopeResultsBorder = {bg = palette.bg1[1], fg = palette.bg1[1]},
    TelescopeResultsTitle = {bg = palette.bg1[1], fg = palette.bg1[1]},

    TelescopePreviewNormal = {bg = palette.bg1[1]},
    TelescopePreviewBorder = {bg = palette.bg1[1], fg = palette.bg1[1]},
    TelescopePreviewTitle = {bg = palette.yellow[1], fg = palette.bg1[1]},

    TelescopeSelection = {bg = palette.bg3[1]},
    TelescopeSelectionCaret = {fg = palette.red[1], bg = palette.bg3[1]},

    -- Lightspeed
    LightspeedLabel = {fg = palette.bg0[1], bg = palette.orange[1]},
    LightspeedLabelOverlapped = {fg = palette.bg0[1], bg = palette.red[1]},
    LightspeedShortcut = {fg = palette.bg0[1], bg = palette.orange[1]},
    LightspeedShortcutOverlapped = {fg = palette.bg0[1], bg = palette.red[1]},
    LightspeedOneCharMatch = {fg = palette.bg0[1], bg = palette.red[1]},

    -- SymbolsOutline
    FocusedSymbol = {bg = palette.bg1[1], fg = palette.yellow[1]},

    -- dap nvim
    DebugPC = {bg = palette.bg1[1]},

    -- Gitsigns
    GitSignsCurrentLineBlame = {fg = palette.bg3[1]},

    -- nvim tree lua
    -- NvimTreeNormal = {bg = extended_colors.base_darker, fg = palette.fg0[1]},

    -- custom
    -- SideWin = {bg = extended_colors.base_darker, fg = palette.fg0[1]},
}

M.apply = function ()

    vim.cmd("colorscheme gruvbox-material")

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
