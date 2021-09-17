local nest = require("nest")

nest.applyKeymaps({
    -- common operation
    {"<leader>", {
        {"w", ":w!<CR>"},
        {"<CR>", ":nohlsearch<CR>"},
    }},

    -- window operation
    -- split
    {"<C-\\>", ":vsp<CR>"},
    {"<A-\\>", ":sp<CR>"},
    -- moving and resize
    {"<Right>", "<C-w>l"},
    {"<S-Right>", ":vertical resize +5<CR>"},
    {"<Left>", "<C-w>h"},
    {"<S-Left>", ":vertical resize -5<CR>"},
    {"<Up>", "<C-w>k"},
    {"<S-Up>", ":resize +5<CR>"},
    {"<Down>", "<C-w>j"},
    {"<S-Down>", ":resize -5<CR>"},

    -- nvimtree
    {"<A-n>", ":NvimTreeToggle<CR>"}
})
