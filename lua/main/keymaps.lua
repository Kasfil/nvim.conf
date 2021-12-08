local wk = require("which-key")

wk.register({
    -- common operation
    ["<leader>"] = {
        name = "common",
        w = {"<CMD>w!<CR>", "save file"},
        ["<CR>"] = {"<CMD>nohlsearch<CR>", "clear highlight"},
    },

    -- window operation
    -- split
    ["<C-\\>"] = {"<CMD>vsp<CR>", "vertical split"},
    ["<A-\\>"] = {"<CMD>sp<CR>", "split"},
    -- moving
    ["<Right>"] = {"<C-w>l", "active window right"},
    ["<Left>"] = {"<C-w>h", "active window left"},
    ["<Down>"] = {"<C-w>j", "active window below"},
    ["<Up>"] = {"<C-w>k", "active window above"},
    -- Resize
    ["<S-Right>"] = {"<CMD>vertical resize +5<CR>", "width +5"},
    ["<S-Left>"] = {"<CMD>vertical resize -5<CR>", "width -5"},
    ["<S-Up>"] = {"<CMD>resize +5<CR>", "height +5"},
    ["<S-Down>"] = {"<CMD>resize -5<CR>", "height -5"},

    -- nvimtree
    ["<A-n>"] = {"<CMD>NvimTreeToggle<CR>", "toggle file tree"},
    ["<A-N>"] = {"<CMD>NvimTreeFocus<CR>", "focus on file tree window"},

    -- bufferline
    ["<TAB>"] = { "<CMD>BufferLineCycleNext<CR>", "Next buffer" },
    ["<S-TAB>"] = { "<CMD>BufferLineCyclePrev<CR>", "Prev buffer" },
    ["<leader>bp"] = { "<CMD>BufferLinePick<CR>", "Pick buffer" },
    ["<leader>bc"] = { "<CMD>BufferLinePickClose<CR>", "Pick close" },

    -- delete buffer by famiu/bufdelete.nvim
    ["<leader>bd"] = { function() require("bufdelete").bufdelete(0) end, "Delete current buffer"}
})
