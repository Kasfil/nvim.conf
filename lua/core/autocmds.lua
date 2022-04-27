local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- close window with q
autocmd("FileType", {
    pattern = {"dap-float", "qf", "git", "fugitive", "gitcommit"},
    command = "nnoremap <buffer><silent> q <cmd>close!<CR>"
})

-- Highlight yanked
local hi_yanked = augroup("HighlightYanked", {clear = true})
autocmd("TextYankPost", {
    group = hi_yanked,
    callback = function()
        vim.highlight.on_yank({higroup = "IncSearch", timeout = 500})
    end
})

-- disable virt-column in certain filetype and buftype
local disable_virt_column = augroup("NoVirtColumn", {clear = true})
autocmd("FileType", {
    group = disable_virt_column,
    pattern = {"toggleterm", "help", "fugitive", "gitcommit", "glowpreview"},
    callback = function()
        require("virt-column").setup_buffer({virtcolumn = ""})
    end
})
autocmd("BufAdd", {
    group = disable_virt_column,
    pattern = {"terminal"},
    callback = function()
        require("virt-column").setup_buffer({virtcolumn = ""})
    end
})

autocmd("FileType", {
    pattern = {"fugitive"},
    callback = function()
        local opts = { buffer=true, silent=true, noremap=true }
        vim.keymap.set("n", "cP", ":Git -c push.default=current push<CR>", opts)
        vim.keymap.set("n", "cp", ":Git pull<CR>", opts)
    end
})

local leap_on = augroup("LeapOn", {clear = true})
autocmd({"User LeapEnter"}, {
    group = leap_on,
    pattern = "*",
    command = "let g:leap_active = 1",
})
autocmd({"User LeapLeave"}, {
    group = leap_on,
    pattern = "*",
    callback = function()
        if vim.g.leap_active ~= nil then
            vim.api.nvim_del_var("leap_active")
        end
    end
})
