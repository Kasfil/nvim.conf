local null_ls = require("null-ls")
local b = null_ls.builtins

local h = require("null-ls.helpers")
local methods = require("null-ls.methods")
local u = require("null-ls.utils")

local severities = {
    error = vim.lsp.protocol.DiagnosticSeverity.Error,
    warning = vim.lsp.protocol.DiagnosticSeverity.Warning,
}

local single_revive = h.make_builtin({
    name = "revive",
    method = methods.internal.DIAGNOSTICS_ON_SAVE,
    filetypes = { "go" },
    generator_opts = {
        command = "revive",
        to_stdin = true,
        from_stderr = false,
        ignore_stderr = false,
        args = {
            "-config",
            "./revive.toml",
            "-formatter",
            "json",
            "$FILENAME",
        },
        format = "json",
        multiple_files = false,
        check_exit_code = function(code)
            return code == 0
        end,
        on_output = function(params)
            local diags = {}
            for _, d in ipairs(params.output) do
                local filename = u.path.join(params.root, d.Position.Start.Filename)
                table.insert(diags, {
                    row = d.Position.Start.Line,
                    col = d.Position.Start.Column,
                    end_row = d.Position.End.Line,
                    end_col = d.Position.End.Column,
                    source = "revive",
                    message = d.Failure,
                    severity = severities[d.Severity],
                    filename = filename,
                })
            end
            return diags
        end,
    },
    factory = h.generator_factory,
})

local sources = {
    -- python
    b.diagnostics.flake8,
    b.formatting.isort,
    b.formatting.black,

    -- golang
    b.formatting.goimports,
    single_revive,

    -- rust
    b.formatting.rustfmt,
}

null_ls.setup({
    debug = true,
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
