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

-- nvim dap
-- debugger mapping
nnoremap["<F5>"] = function() require("dap").continue() end
nnoremap["<F17>"] = function() require("dap").terminate() end
nnoremap["<F4>"] = function() require("dap").run_last() end
nnoremap["<F10>"] = function() require("dap").step_over() end
nnoremap["<F9>"] = function() require("dap").step_into() end
nnoremap["<F21>"] = function() require("dap").step_out() end
nnoremap["<leader>dc"] = function() require("dap").clear_breakpoints() end
nnoremap["<leader>db"] = function() require("dap").toggle_breakpoint() end
nnoremap["<leader>dB"] = function() require("dap").set_breakpoint(vim.fn.input("condition: ")) end
nnoremap["<leader>dl"] = function() require("dap").set_breakpoint(nil, nil, vim.fn.input("log point message: ")) end
nnoremap["<leader>dr"] = function() require("dap").repl.open() end
-- debugger widget
nnoremap["<space>K"] = function() require("dap.ui.widgets").hover() end
nnoremap["<space>ws"] = function() require("dap.ui.widgets").sidebar(require("dap.ui.widgets").frames).open() end
nnoremap["<space>wc"] = function() require("dap.ui.widgets").centered_float(require("dap.ui.widgets").scopes) end

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
