local null_ls = require("null-ls")
local b = null_ls.builtins

local sources = {
    -- python
    b.diagnostics.flake8,
    b.formatting.isort,
    b.formatting.black,

    -- golang
    b.diagnostics.revive,

    -- rust
    b.formatting.rustfmt,
}

null_ls.setup({
    debug = true,
    sources = sources,

    -- format on save
    on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
            vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
        end
    end,
})
