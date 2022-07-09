local treesitter = require("nvim-treesitter.configs")
local ensured = {
    "go", "gomod", "rust", "comment", "javascript", "typescript",
    "python", "graphql", "json", "jsonc", "lua", "yaml", "toml", "vue",
    "markdown", "markdown_inline"
}

treesitter.setup({
    ensure_installed = ensured,
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
        disable = { "python", "yaml" }
    },
})
