import("nvim-treesitter.configs", function(treesitter)
  treesitter.setup({
    ensure_installed = {
      "bash",
      "comment",
      "gitignore",
      "go",
      "gomod",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "sql",
      "vim",
      "toml",
      "yaml",
    },
    sync_install = true,
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
      disable = { "python", "yaml" },
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
end)
