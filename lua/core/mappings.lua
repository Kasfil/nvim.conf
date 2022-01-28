local utils = require("core.utils")
local map = require("cartographer")

local nnoremap = map.n.nore.silent

nnoremap["<leader>w"] = ":write! <CR>"
nnoremap["<leader>x"] = ":Bdelete! <CR>"
nnoremap["<leader>q"] = function() utils.close_window() end
nnoremap["<leader>bp"] = ":BufferLinePick <CR>"
nnoremap["<leader>bc"] = ":BufferLinePickClose <CR>"
nnoremap["<leader>ff"] = ":Telescope find_files <CR>"
nnoremap["<leader>fw"] = ":Telescope live_grep <CR>"
nnoremap["<leader>fb"] = ":Telescope buffers <CR>"
nnoremap["<leader>fh"] = ":Telescope help_tags <CR>"

-- Space mapping
nnoremap["<space>o"] = ":SymbolsOutline<CR>"
nnoremap["<space>d"] = ":TroubleToggle<CR>"
nnoremap["<space>g"] = ":Neogit<CR>"
nnoremap["<space>t"] = ":ToggleTerm<CR>"

nnoremap["<ESC>"] = ":nohlsearch <CR>"
nnoremap["<C-\\>"] = "<CMD>vsp<CR>"
nnoremap["<A-\\>"] = "<CMD>sp<CR>"

-- moving
nnoremap["<C-l>"] = "<C-w>l"
nnoremap["<C-h>"] = "<C-w>h"
nnoremap["<C-j>"] = "<C-w>j"
nnoremap["<C-k>"] = "<C-w>k"

-- Resize
nnoremap["<S-Right>"] = ":vertical resize +5 <CR>"
nnoremap["<S-Left>"] = ":vertical resize -5 <CR>"
nnoremap["<S-Up>"] = ":resize +5 <CR>"
nnoremap["<S-Down>"] = ":resize -5 <CR>"

-- nvimtree
nnoremap["<A-n>"] = ":NvimTreeToggle <CR>"
nnoremap["<A-N>"] = ":NvimTreeFocus <CR>"

-- bufferline
nnoremap["<TAB>"] =  ":BufferLineCycleNext <CR>"
nnoremap["<S-TAB>"] =  ":BufferLineCyclePrev <CR>"

-- terminal mode
map.t.nore.silent["qq"] = function() utils.close_window() end
