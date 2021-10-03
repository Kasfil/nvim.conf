local g = vim.g

g.nvim_tree_ignore = {".git", "node_modules", "cache", "__pycache__"}
g.nvim_tree_gitignore = 1
g.nvim_tree_quit_on_open = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_hide_dotfiles = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 0

require("nvim-tree").setup({
    view = {
        width = 32,
        side = "left",
    },
    auto_close = true,
    disable_netrw = true,
    hijack_netrw = true,
    lsp_diagnostics = true,
    hijack_cursor = true,
    update_cwd = true,
})
