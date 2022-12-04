import({ "null-ls", "null-ls.helpers" }, function(mods)
  local null_ls = mods["null-ls"]
  local helpers = mods["null-ls.helpers"]
  local b = null_ls.builtins
  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

  local revive = {
    name = "revive",
    method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
    filetypes = { "go" },
    generator = helpers.generator_factory({
      args = {
        "-set_exit_status",
        "-config=" .. vim.fn.expand("$HOME/.config/revive.toml"),
        "-exclude=vendor/...",
        "$FILENAME",
      },
      check_exit_code = function(code)
        return code < 1
      end,
      command = "revive",
      format = "line",
      from_stderr = true,
      on_output = helpers.diagnostics.from_patterns({
        {
          pattern = "([^:]+):(%d+):(%d+):%s(.+)",
          groups = { "path", "row", "col", "message" },
        },
      }),
      to_stdin = true,
    }),
  }

  local sources = {
    -- python
    b.diagnostics.flake8,
    b.formatting.isort,
    b.formatting.black,
    b.diagnostics.mypy,

    -- golang
    b.formatting.goimports,
    revive,

    -- lua
    b.formatting.stylua,

    -- rust
    b.formatting.rustfmt,

    -- json
    b.formatting.jq,

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
            vim.lsp.buf.format({ bufnr = bufnr })
          end,
        })
      end
    end,
  })
end)
