local wk = require("which-key")

wk.register({
    -- common operation
    ["<leader>"] = {
        name = "common",
        w = {"<cmd>w!<CR>", "save file"},
        ["<CR>"] = {"<cmd>nohlsearch<CR>", "clear highlight"},
    },

    -- window operation
    -- split
    ["<C-\\>"] = {"<cmd>vsp<CR>", "vertical split"},
    ["<A-\\>"] = {"<cmd>sp<CR>", "split"},
    -- moving
    ["<Right>"] = {"<C-w>l", "active window right"},
    ["<Left>"] = {"<C-w>h", "active window left"},
    ["<Down>"] = {"<C-w>j", "active window below"},
    ["<Up>"] = {"<C-w>k", "active window above"},
    -- Resize
    ["<S-Right>"] = {"<cmd>vertical resize +5<CR>", "width +5"},
    ["<S-Left>"] = {"<cmd>vertical resize -5<CR>", "width -5"},
    ["<S-Up>"] = {"<cmd>resize +5<CR>", "height +5"},
    ["<S-Down>"] = {"<cmd>resize -5<CR>", "height -5"},

    -- nvimtree
    ["<A-n>"] = {"<cmd>NvimTreeToggle<CR>", "toggle file tree"},
    ["<A-N>"] = {"<cmd>NvimTreeFocus<CR>", "focus on file tree window"},

    -- Outline symbols
    ["<A-o>"] = { "<cmd>SymbolsOutline<CR>", "Toggle Outline" },

    -- bufferline
    ["<TAB>"] = { "<cmd>BufferLineCycleNext<CR>", "Next buffer" },
    ["<S-TAB>"] = { "<cmd>BufferLineCyclePrev<CR>", "Prev buffer" },
    ["<leader>bp"] = { "<cmd>BufferLinePick<CR>", "Pick buffer" },
})
