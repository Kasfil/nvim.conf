import("nvim-tree", function(nvimtree)
  nvimtree.setup({
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    ignore_ft_on_setup = {},
    open_on_tab = false,
    hijack_cursor = true,
    update_cwd = false,
    hijack_unnamed_buffer_when_opening = false,
    diagnostics = {
      enable = false,
    },
    update_focused_file = {
      enable = true,
      update_cwd = false,
      ignore_list = { "help", "nowrite" },
    },
    system_open = {
      cmd = nil,
      args = {},
    },
    filters = {
      dotfiles = false,
      custom = { ".git", "node_modules", "cache", "__pycache__" },
    },
    git = {
      enable = true,
      ignore = false,
      timeout = 500,
    },
    renderer = {
      indent_markers = {
        enable = true,
      },
      icons = {
        show = {
          folder_arrow = false,
        },
        glyphs = {
          git = {
            untracked = "",
            deleted = "",
            ignored = "",
          },
        },
      },
    },
    view = {
      width = 32,
      hide_root_folder = true,
      side = "left",
      preserve_window_proportions = false,
      mappings = {
        custom_only = false,
        list = {},
      },
      number = false,
      relativenumber = false,
      float = {
        enable = false,
        open_win_config = {
          border = "single",
          width = 35,
          height = vim.api.nvim_win_get_height(0) - vim.opt.cmdheight:get(),
        },
      },
    },
    trash = {
      cmd = "trash",
      require_confirm = true,
    },
    actions = {
      open_file = {
        quit_on_open = false,
        window_picker = {
          exclude = {
            filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame", "Outline" },
            buftype = { "nofile", "terminal", "help" },
          },
        },
      },
    },
  })
end)
