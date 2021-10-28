local opt = vim.opt

opt.termguicolors = true
opt.mouse = "nv"
opt.errorbells = true
opt.visualbell = true
opt.hidden = true
opt.fileformats = "unix,mac,dos"
opt.magic = true
opt.virtualedit = "block"
opt.encoding = "utf-8"
opt.viewoptions = "folds,cursor,curdir,slash,unix"
opt.sessionoptions = "curdir,help,tabpages,winsize"
opt.clipboard = "unnamedplus"
opt.wildignorecase = true
opt.wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**"
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.history = 2000
opt.shada = "!,'3000,<50,@100,s10,h"
opt.backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim"
opt.smarttab = true
opt.shiftround = true
opt.timeout = true
opt.ttimeout = true
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
opt.jumpoptions = "stack"
opt.showmode = false
opt.shortmess = "aoOTIcF"
opt.scrolloff = 2
opt.sidescrolloff = 5
opt.foldlevelstart = 99
opt.ruler = false
opt.list = true
opt.winwidth = 30
opt.winminwidth = 10
opt.pumheight = 15
opt.helpheight = 12
opt.previewheight = 12
opt.showcmd = false
opt.cmdheight = 2
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

if vim.g.nvui then
    opt.guifont = "JetBrains Mono:h10.5"
end

if vim.g.fvim_loaded then
    opt.guifont = "JetBrains Mono:h12"
    -- vim.cmd("FVimCursorSmoothMove true")
    -- vim.cmd("FVimCursorSmoothBlink true")
end
