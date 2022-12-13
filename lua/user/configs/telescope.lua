import({ "telescope", "telescope.actions", "telescope.builtin" }, function(mods)
  local map = require("user.utils").map

  local telescope = mods.telescope
  local t_builtin = mods["telescope.builtin"]

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
      mappings = {},
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
          preview_width = 0.6,
          results_width = 0.4,
        },
        vertical = {
          mirror = false,
        },
        width = 0.7,
        height = 0.7,
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
