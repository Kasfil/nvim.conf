local lsp = require("lspconfig")
local nest = require("nest")

require("lsp.completion")
require("lsp.trouble")
require("lsp.snippet")

local on_attach = function(_, bufnr)
    local function bufsetoption(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- enable completion triggered by <C-x><C-o>
    bufsetoption("omnifunc", "v:lua.vim.lsp.omnifunc")

    nest.defaults.buffer = true
    nest.applyKeymaps({
        {"g", {
            {"d", function() vim.lsp.buf.definition() end},
            {"D", function() require("lspsaga.provider").preview_definition() end},
            {"i", function() require("lspsaga.provider").lsp_finder() end},
        }},
        {"K", function() require("lspsaga.hover").render_hover_doc() end},
        {"<space>", {
            {"D", function() vim.lsp.buf.type_definition() end},
            {"e", function() require("lspsaga.diagnostic").show_line_diagnostics() end},
            {"ca", function() require("lspsaga.codeaction").code_action() end},
            {mode = "v", "ca", function() require("lspsaga.codeaction").range_code_action() end},
            {"rn", function() require("lspsaga.rename").rename() end},
            {"gs", function() require("lspsaga.signaturehelp").signature_help() end},
        }},
        {"[e", function() require("lspsaga.diagnostic").lsp_jump_diagnostic_prev() end},
        {"]e", function() require("lspsaga.diagnostic").lsp_jump_diagnostic_next() end},
        {"<C-f>", function() require("lspsaga.action").smart_scroll_with_saga(1) end},
        {"<C-b>", function() require("lspsaga.action").smart_scroll_with_saga(-1) end},
    })
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

local sumneko_root = os.getenv("HOME") .. "/github/lua-language-server"
local sumneko_binary = sumneko_root .. "/bin/Linux/lua-language-server"

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lsp.sumneko_lua.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {sumneko_binary, "-E", sumneko_root .. "/main.lua"},
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = runtime_path,
            },
            diagnostics = {
                globals = {"vim"},
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

lsp.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
                typeCheckingMode = "off",
            }
        }
    }
})

lsp.jedi_language_server.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lsp.gopls.setup({
    on_attach = on_attach,
    capabilities = capabilities
})

lsp.rls.setup({
    on_attach = on_attach,
    capabilities = capabilities
})

local eslint = {
    lintCommand = "eslint -f visualstudio --stdin --stdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {
        "%f(%l,%c): %tarning %m",
        "%f(%l,%c): %rror %m"
    },
}

local flake8 = {
    lintCommand = "flake8 --stdin-display-name ${INPUT} -",
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"}
}

local revive = {
    lintCommand = "revive ${INPUT}",
    lintStdin = true,
    lintIgnoreExitCode = true,
    lintFormats = {"%f:%l:%c: %m"},
}

local languages = {
    python = {flake8},
    go = {revive},
    javascript = {eslint},
    typescript = {eslint},
}

lsp.efm.setup({
    init_options = {
        documentFormatting = false,
        codeAction = true,
    },
    filetypes = vim.tbl_keys(languages),
    settings = {
        rootMarkers = {".git/"},
        languages = languages
    }
})
