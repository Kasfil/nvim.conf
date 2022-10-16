import({ "lspconfig", "nvim-navic" }, function(mods)
  local map = require("user.utils").map
  local navic = mods["nvim-navic"]
  local lsp = mods.lspconfig

  vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
  vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
  vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
  vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

  vim.diagnostic.config({
    virtual_text = {
      source = "always",
      prefix = "■ ",
    },
    severity_sort = true,
  })

  map("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>")
  map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
  map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
  map("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>")

  local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- attach navic
    navic.attach(client, bufnr)

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opt = { buffer = bufnr }
    map("n", "gf", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
    map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
    map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
    map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
    map("n", "gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
    map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
    map("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opt)
    map("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opt)
    map("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opt)
    map("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opt)
    map("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
    map("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
    map("n", "<space>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opt)
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.preselectSupport = true
  capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
  capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
  capabilities.textDocument.completion.completionItem.deprecatedSupport = true
  capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
  capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }
  -- add nvim-cmp capabilities
  capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

  -- basic lsp config servers
  local servers = { "rls", "vuels", "tsserver", "pyright" }
  for _, server in pairs(servers) do
    lsp[server].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end

  local sumneko_root = os.getenv("HOME") .. "/.apps/lua-language-server"
  local sumneko_binary = sumneko_root .. "/bin/lua-language-server"

  local runtime_path = vim.split(package.path, ";")
  table.insert(runtime_path, "lua/?.lua")
  table.insert(runtime_path, "lua/?/init.lua")

  lsp.sumneko_lua.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { sumneko_binary },
    settings = {
      Lua = {
        format = {
          enable = false,
        },
        runtime = {
          version = "LuaJIT",
          path = runtime_path,
        },
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = {
          enable = false,
        },
      },
    },
  })

  -- lsp.jedi_language_server.setup({
  --   on_attach = on_attach,
  --   capabilities = capabilities,
  --   init_options = {
  --     diagnostics = {
  --       enable = false,
  --     },
  --   },
  -- })

  lsp.gopls.setup({
    on_attach = function(client, bufnr)
      client.server_capabilities.document_formatting = false
      client.server_capabilities.document_range_formatting = false

      on_attach(client, bufnr)
    end,
    capabilities = capabilities,
  })
end)
