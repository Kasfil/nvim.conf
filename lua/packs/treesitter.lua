local treesitter = require("nvim-treesitter.configs")

local setup_treesitter = function()
    local ensured = {
        "go", "gomod", "rust", "comment", "javascript", "typescript",
        "python", "graphql", "json", "jsonc", "lua", "yaml", "toml"
    }

    treesitter.setup({
        ensure_installed = ensured,
        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
            disable = {"python"}
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "gnn",
                node_incremental = "grn",
                scope_incremental = "grc",
                node_decremental = "grm",
            },
        },
    })
end

setup_treesitter()
