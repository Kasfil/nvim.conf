local wk = require("which-key")

require("symbols-outline").setup({
    relative_width = true,
    auto_preview = false,
    width = 40,
    lsp_blacklist = {"pyright", "efm"},
    symbols = {
        File = {icon = " ", hl = "TSURI"},
        Module = {icon = " ", hl = "TSNamespace"},
        Namespace = {icon = " ", hl = "TSNamespace"},
        Package = {icon = " ", hl = "TSNamespace"},
        Class = {icon = " ", hl = "TSType"},
        Method = {icon = "ƒ ", hl = "TSMethod"},
        Property = {icon = " ", hl = "TSMethod"},
        Field = {icon = " ", hl = "TSField"},
        Constructor = {icon = " ", hl = "TSConstructor"},
        Enum = {icon = " ", hl = "TSType"},
        Interface = {icon = " ", hl = "TSType"},
        Function = {icon = " ", hl = "TSFunction"},
        Variable = {icon = " ", hl = "TSConstant"},
        Constant = {icon = " ", hl = "TSConstant"},
        String = {icon = " ", hl = "TSString"},
        Number = {icon = " ", hl = "TSNumber"},
        Boolean = {icon = "⊨ ", hl = "TSBoolean"},
        Array = {icon = " ", hl = "TSConstant"},
        Object = {icon = " ", hl = "TSType"},
        Key = {icon = " ", hl = "TSType"},
        Null = {icon = "NULL", hl = "TSType"},
        EnumMember = {icon = " ", hl = "TSField"},
        Struct = {icon = " ", hl = "TSType"},
        Event = {icon = " ", hl = "TSType"},
        Operator = {icon = "+ ", hl = "TSOperator"},
        TypeParameter = {icon = "𝙏 ", hl = "TSParameter"}
    }
})

wk.register({
    -- Outline symbols
    ["<space>o"] = { function() require("symbols-outline").toggle_outline() end, "Toggle Outline" },
}, { nowait = true, silent = false })
