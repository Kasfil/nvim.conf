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
