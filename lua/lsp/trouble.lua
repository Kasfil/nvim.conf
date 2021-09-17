local nest = require("nest")

require("trouble").setup({
    height = 12,
    mode = "lsp_document_diagnostics"
})

nest.applyKeymaps({{"<A-d>", ":TroubleToggle<CR>"}})
