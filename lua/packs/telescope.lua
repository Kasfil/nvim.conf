local nest = require("nest")
local telescope = require("telescope")
local action = require("telescope.actions")

telescope.setup({
    defaults = {
        selection_caret = " ",
        mappings = {
            i = {
                ["<ESC>"] = action.close
            }
        }
    },
})

nest.applyKeymaps({
    {"<leader>", {
        {"ff", function() require("telescope.builtin").find_files() end},
        {"fg", function() require("telescope.builtin").live_grep() end},
        {"fb", function() require("telescope.builtin").buffers() end},
        {"fh", function() require("telescope.builtin").help_tags() end},
    }}
})
