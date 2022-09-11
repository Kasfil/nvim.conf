local map = require("user.utils").map
local close_win = require("user.utils").close_window
local path = require("plenary.path")

map("n", "<leader>w", function()
  vim.cmd("write")
  vim.notify(path:new(vim.call("expand", "%")):normalize() .. " saved", "info", {
    title = "notification",
    render = "minimal",
    timeout = 250,
    hide_from_history = true,
  })
end)
map("n", "<leader>x", ":Bdelete! <CR>") -- close buffer w/o ruin your window
map("n", "<leader>X", ":bdelete! <CR>") -- close buffer also close window
map("n", "<leader>q", function()
  close_win()
end)

-- Space mapping
map("n", "<space>o", ":SymbolsOutline<CR>")
map("n", "<space>d", ":TroubleToggle<CR>")
map("n", "<space>g", ":Neogit<CR>")

map("n", "<space>tt", ":ToggleTerm direction=horizontal<CR>")
map("n", "<space>tf", ":ToggleTerm direction=float<CR>")
map("n", "<space>tg", function()
  ToggleLazygit()
end)

map("n", "<ESC>", ":nohlsearch <CR>")
map("n", "<C-\\>", "<CMD>vsp<CR>")
map("n", "<A-\\>", "<CMD>sp<CR>")

-- [[ Currently this mapping handled by aserowy/tmux.nvim
-- moving
-- map("n", "<C-l>", "<C-w>l")
-- map("n", "<C-h>", "<C-w>h")
-- map("n", "<C-j>", "<C-w>j")
-- map("n", "<C-k>", "<C-w>k")

-- Resize
-- map("n", "<S-Right>", ":vertical resize +5 <CR>")
-- map("n", "<S-Left>", ":vertical resize -5 <CR>")
-- map("n", "<S-Up>", ":resize +5 <CR>")
-- map("n", "<S-Down>", ":resize -5 <CR>")
-- ]]

map("n", "<leader>rn", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true, silent = false })

-- zen mode
map("n", "<leader>zf", ":TZFocus <CR>")
map("n", "<leader>za", ":TZAtaraxis <CR>")
map("n", "<leader>zm", ":TZMinimalist <CR>")

-- nvimtree
map("n", "<A-n>", ":NvimTreeToggle <CR>")
map("n", "<A-N>", ":NvimTreeFocus <CR>")

map("n", "Y", "y$")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- this mapping lead crash when using cartographer
map("n", "J", "mzJ`z")

map("i", "<A-Up>", "<esc>:m .-2<CR>==a")
map("i", "<A-Down>", "<esc>:m .+1<CR>==a")
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("n", "<A-Up>", ":m .-2<CR>==")
map("n", "<A-Down>", ":m .+1<CR>==")

-- neotest
map("n", "<leader>tv", ":NeotestSummaryToggle <CR>")
