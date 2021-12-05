local g = vim.g

g.nvim_tree_quit_on_open = 0
g.nvim_tree_indent_markers = 1
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
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = true,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = true,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {".git", "node_modules", "cache", "__pycache__"}
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  view = {
    width = 40,
    height = 30,
    hide_root_folder = false,
    side = "left",
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  }
})
