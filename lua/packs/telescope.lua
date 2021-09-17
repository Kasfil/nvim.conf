local nest = require("nest")

nest.applyKeymaps({
    {"<leader>", {
        {"ff", function() require("telescope.builtin").find_files() end},
        {"fg", function() require("telescope.builtin").live_grep() end},
        {"fb", function() require("telescope.builtin").buffers() end},
        {"fh", function() require("telescope.builtin").help_tags() end},
    }}
})
