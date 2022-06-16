local opt = vim.opt
local g = vim.g

local wildignore = {
    -- files
    ".git", ".hg", ".svn", "*.pyc", "*.o", "*.out", "*.DS_Store",
    -- Directories
    "**/tmp/**", "**/node_modules/**", "**/bower_modules/**", "**/__pycache__/**"
}

opt.equalalways = false
opt.termguicolors = true
opt.mouse = "a"
opt.hidden = true
opt.clipboard = "unnamedplus"
opt.wildignorecase = true
opt.wildignore = wildignore
opt.ignorecase = true
opt.smartcase = true
opt.wrap = false
opt.title = true
opt.cmdheight = 0
opt.cul = true
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.history = 500
opt.timeoutlen = 500
opt.ttimeoutlen = 10
opt.updatetime = 100
opt.redrawtime = 1000
opt.splitbelow = true
opt.splitright = true
opt.backspace = "indent,eol,start"
opt.completeopt = "menu,menuone,noselect"
opt.scrolloff = 5
opt.sidescrolloff = 7
opt.number = true
opt.relativenumber = true
opt.showmode = false
opt.shortmess = "aoOTIcF"
opt.pumheight = 15
opt.previewheight = 15
opt.laststatus = 2
opt.list = true
opt.listchars = {tab="»·",nbsp="+",trail="·",extends="→",precedes="←",eol="↲"}
opt.fillchars = {
    eob=" ",
    horiz = '━',
    horizup = '┻',
    horizdown = '┳',
    vert = '┃',
    vertleft  = '┫',
    vertright = '┣',
    verthoriz = '╋',
}
opt.formatoptions = "1jcroql"
opt.signcolumn = "yes"
opt.conceallevel = 2
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

if g.neovide == true then
    opt.guifont = [[JetBrains Mono:h10.7]]
end

local disabled_built_ins = {
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "matchit",
    "tar",
    "tarPlugin",
    "rrhelper",
    "spellfile_plugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end

g.mapleader = ","
g.python3_host_prog = "/usr/bin/python3"
