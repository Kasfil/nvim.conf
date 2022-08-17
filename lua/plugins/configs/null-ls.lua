local null_ls = require("null-ls")
local b = null_ls.builtins
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local sources = {
    -- python
    b.diagnostics.flake8,
    b.formatting.isort,
    b.formatting.black,

    -- golang
    b.formatting.goimports,
    b.diagnostics.revive,

    -- rust
    b.formatting.rustfmt,

    -- json
    b.diagnostics.jsonlint,

    -- javascript
    b.code_actions.eslint_d,
    b.diagnostics.eslint_d,
    b.formatting.eslint_d,
}

null_ls.setup({
    sources = sources,

    -- format on save
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({bufnr = bufnr})
                end,
            })
        end
    end,
})
