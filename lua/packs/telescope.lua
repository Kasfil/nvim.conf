local telescope = require("telescope")
local action = require("telescope.actions")
local wk = require("which-key")

telescope.setup({
    defaults = {
        selection_caret = " ",
        prompt_prefix = "    ",
        mappings = {
            i = {
                ["<ESC>"] = action.close
            }
        }
    },
})

wk.register({
    ["<leader>f"] = {
        name = "telescope",
        f = {function() require("telescope.builtin").find_files({hidden=true, no_ignore=true}) end, "find files"},
        g = {function() require("telescope.builtin").live_grep() end, "find word"},
        b = {function() require("telescope.builtin").buffers() end, "list buffers"},
        h = {function() require("telescope.builtin").help_tags() end, "find help tags"},
    }
})
