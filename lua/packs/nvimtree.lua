local g = vim.g

g.nvim_tree_quit_on_open = 0
g.nvim_tree_indent_markers = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 0
g.nvim_tree_window_picker_exclude = {
    filetype = {
        "notify",
        "packer",
        "qf",
        "Outline",
    }
}

require("nvim-tree").setup({
    open_on_setup = false,
    view = {
        width = 40,
        side = "left",
    },
    filters = {
        dotfiles = true,
        custom = {".git", "node_modules", "cache", "__pycache__"}
    },
    auto_close = true,
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    update_cwd = true,
    diagnostics = {
        enable = false,
    },
})
