---@diagnostic disable: lowercase-global
import("telescope", function(telescope)
  local map = require("user.utils").map

  t_action = nil
  t_builtin = nil

  import("telescope.actions", function(_)
    t_action = _
  end)

  import("telescope.builtin", function(_)
    t_builtin = _
  end)

  telescope.setup({
    defaults = {
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
      },
      mappings = {
        i = {
          ["<ESC>"] = t_action.close,
        },
      },
      selection_caret = " ",
      prompt_prefix = "Find  ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
          results_width = 0.8,
        },
        vertical = {
          mirror = false,
        },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120,
      },
      file_ignore_patterns = { "node_modules", "%.log", "__pycache__/", ".git/" },
      path_display = { "truncate" },
      winblend = 0,
      border = {},
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      color_devicons = true,
      use_less = true,
      set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    },
  })

  telescope.load_extension("persisted")

  -- mappings
  map("n", "<leader>ff", function()
    t_builtin.find_files({ hidden = true, no_ignore = true })
  end)
  map("n", "<leader>fw", function()
    t_builtin.live_grep()
  end)
  map("n", "<leader>fh", function()
    t_builtin.help_tags()
  end)
  map("n", "<leader>fc", function()
    t_builtin.commands()
  end)
  map("n", "<leader>fm", function()
    t_builtin.keymaps({
      layout_config = {
        width = 0.5,
      },
    })
  end)
end)
