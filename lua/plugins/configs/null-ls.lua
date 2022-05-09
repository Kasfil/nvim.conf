local null_ls = require("null-ls")
local b = null_ls.builtins

local sources = {
    -- python
    b.diagnostics.flake8,
    b.formatting.isort,
    b.formatting.black,

    -- golang
    b.formatting.goimports,
    b.diagnostics.revive.with({
        args = { "-formatter", "json", "$FILENAME" }
    }),

    -- rust
    b.formatting.rustfmt,

    -- json
    b.diagnostics.jsonlint,
}

null_ls.setup({
    sources = sources,

    -- format on save
    on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
            vim.api.nvim_create_autocmd("BufWritePre", {
                callback = function()
                    vim.lsp.buf.formatting_sync()
                end,
                buffer = 0,
            })
        end
    end,
})
