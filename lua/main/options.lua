local opt = vim.opt
local g = vim.g

-- Neovim/Vim options
opt.termguicolors = true
opt.mouse = "nv"
opt.hidden = true
opt.fileformats = "unix,mac,dos"
opt.clipboard = "unnamedplus"
opt.wildignorecase = true
opt.wildignore = {
    -- files
    ".git", ".hg", ".svn", "*.pyc", "*.o", "*.out", "*.DS_Store",
    -- Directories
    "**/tmp/**", "**/node_modules/**", "**/bower_modules/**", "**/__pycache__/**"
}
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.history = 2000
opt.shada = "!,'3000,<50,@100,s10,h"
opt.shiftround = true
opt.timeoutlen = 500
opt.ttimeoutlen = 10
opt.updatetime = 100
opt.redrawtime = 1500
opt.ignorecase = true
opt.smartcase = true
opt.infercase = true
opt.incsearch = true
opt.wrapscan = true
opt.complete = ".,w,b,k"
opt.inccommand = "nosplit"
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --hidden --vimgrep --smart-case --"
opt.breakat = [[\ \	;:,!?]]
opt.startofline = false
opt.whichwrap = "h,l,<,>,[,],~"
opt.splitbelow = true
opt.splitright = true
opt.switchbuf = "useopen"
opt.backspace = "indent,eol,start"
opt.diffopt = "filler,iwhite,internal,algorithm:patience"
opt.completeopt = "menuone,noselect"
opt.showmode = false
opt.shortmess = "aoOTIcF"
opt.scrolloff = 2
opt.sidescrolloff = 5
opt.foldlevelstart = 99
opt.ruler = false
opt.pumheight = 15
opt.helpheight = 12
opt.previewheight = 12
opt.showcmd = false
opt.cmdheight = 1
opt.cmdwinheight = 5
opt.laststatus = 2
opt.display = "lastline"
opt.showbreak = "↳  "
opt.listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←,eol:↲"
opt.fillchars = {eob = " "}
opt.pumblend = 10
opt.winblend = 10
opt.formatoptions = "1jcroql"
opt.textwidth = 80
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.breakindentopt = "shift:2,min:20"
opt.wrap = false
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.conceallevel = 2
opt.colorcolumn = "89,101"

-- Disable distributed plugin
g.loaded_gzip = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_matchit = 1
g.loaded_matchparen = 1
g.loaded_2html_plugin = 1
g.loaded_logiPat = 1
g.loaded_rrhelper = 1
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1
g.loaded_netrwFileHandlers = 1

-- Set map leader
g.mapleader = ","
