local lua_fn = require("core.map_utils").lua_fn
local key = vim.api.nvim_set_keymap

local noremap = { noremap = true, silent = true }

key("n", "<leader>w", ":write! <CR>", noremap) -- write buffer
key("n", "<leader>x", ":Bdelete! <CR>", noremap) -- close buffer w/o ruin your window

key("n", "<leader>q", ":q! <CR>", noremap)

key("n", "<leader>bp", ":BufferLinePick <CR>", noremap)
key("n", "<leader>bc", ":BufferLinePickClose <CR>", noremap)
key("n", "<leader>ff", ":Telescope find_files <CR>", noremap)
key("n", "<leader>fw", ":Telescope live_grep <CR>", noremap)
key("n", "<leader>fb", ":Telescope buffers <CR>", noremap)
key("n", "<leader>fh", ":Telescope help_tags <CR>", noremap)

-- Space mapping
key("n", "<space>o", ":SymbolsOutline<CR>", noremap)
key("n", "<space>d", ":TroubleToggle<CR>", noremap)
key("n", "<space>g", ":G<CR>", noremap)
key("n", "<space>t", ":ToggleTerm<CR>", noremap)

key("n", "<ESC>", ":nohlsearch <CR>", noremap)
key("n", "<C-\\>", "<CMD>vsp<CR>", noremap)
key("n", "<A-\\>", "<CMD>sp<CR>", noremap)

-- nvim dap
-- debugger mapping
key("n", "<F5>", lua_fn(function() require("dap").continue() end), noremap)
key("n", "<F17>", lua_fn(function() require("dap").terminate() end), noremap)
key("n", "<F4>", lua_fn(function() require("dap").run_last() end), noremap)
key("n", "<F10>", lua_fn(function() require("dap").step_over() end), noremap)
key("n", "<F9>", lua_fn(function() require("dap").step_into() end), noremap)
key("n", "<F21>", lua_fn(function() require("dap").step_out() end), noremap)
key("n", "<leader>dc", lua_fn(function() require("dap").clear_breakpoints() end), noremap)
key("n", "<leader>db", lua_fn(function() require("dap").toggle_breakpoint() end), noremap)
key("n", "<leader>dB", lua_fn(function() require("dap").set_breakpoint(vim.fn.input("condition: ")) end), noremap)
key("n", "<leader>dl", lua_fn(function() require("dap").set_breakpoint(nil, nil, vim.fn.input("log point message: ")) end), noremap)
key("n", "<leader>dr", lua_fn(function() require("dap").repl.open() end), noremap)
-- debugger widget
key("n", "<space>K", lua_fn(function() require("dap.ui.widgets").hover() end), noremap)
key("n", "<space>ws", lua_fn(function() require("dap.ui.widgets").sidebar(require("dap.ui.widgets").frames).open() end), noremap)
key("n", "<space>wc", lua_fn(function() require("dap.ui.widgets").centered_float(require("dap.ui.widgets").scopes) end), noremap)

-- moving
key("n", "<C-l>", "<C-w>l", noremap)
key("n", "<C-h>", "<C-w>h", noremap)
key("n", "<C-j>", "<C-w>j", noremap)
key("n", "<C-k>", "<C-w>k", noremap)

-- Resize
key("n", "<S-Right>", ":vertical resize +5 <CR>", noremap)
key("n", "<S-Left>", ":vertical resize -5 <CR>", noremap)
key("n", "<S-Up>", ":resize +5 <CR>", noremap)
key("n", "<S-Down>", ":resize -5 <CR>", noremap)

-- nvimtree
key("n", "<A-n>", ":NvimTreeToggle <CR>", noremap)
key("n", "<A-N>", ":NvimTreeFocus <CR>", noremap)

-- bufferline
key("n", "<TAB>",  ":BufferLineCycleNext <CR>", noremap)
key("n", "<S-TAB>",  ":BufferLineCyclePrev <CR>", noremap)

key("n", "Y", "y$", noremap)
key("n", "n", "nzzzv", noremap)
key("n", "N", "Nzzzv", noremap)

-- this mapping lead crash when using cartographer
key("n", "J", "mzJ`z", noremap)

key("i", "<A-Up>", "<esc>:m .-2<CR>==a", noremap)
key("i", "<A-Down>", "<esc>:m .+1<CR>==a", noremap)
key("v", "J", ":m '>+1<CR>gv=gv", noremap)
key("v", "K", ":m '<-2<CR>gv=gv", noremap)
key("n", "<A-Up>", ":m .-2<CR>==", noremap)
key("n", "<A-Down>", ":m .+1<CR>==", noremap)

-- terminal mode
key("t", "<esc>", "<C-\\><C-n>", noremap)
