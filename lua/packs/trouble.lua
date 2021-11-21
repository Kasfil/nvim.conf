local wk = require("which-key")
require("trouble").setup({
    height = 12,
    mode = "lsp_document_diagnostics"
})

wk.register({
    ["<A-d>"] = { "<cmd>TroubleToggle<CR>", "toggle trouble.nvim" }
})
