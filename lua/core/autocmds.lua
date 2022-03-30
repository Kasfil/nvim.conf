local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- close window with q
autocmd("FileType", {
    pattern = {"dap-float", "qf"},
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

-- nvim lightbulb
autocmd({"CursorHold", "CursorHoldI"}, {
    callback = function()
        require("nvim-lightbulb").update_lightbulb()
    end
})

-- disable virt-column in certain filetype and buftype
local disable_virt_column = augroup("NoVirtColumn", {clear = true})
autocmd("FileType", {
    group = disable_virt_column,
    pattern = {"toggleterm", "help"},
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
