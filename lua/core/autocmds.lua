-- close dap-float filetypes with q
vim.cmd [[autocmd FileType dap-float nnoremap <buffer><silent> q <cmd>close!<CR>]]
vim.cmd [[autocmd FileType qf nnoremap <buffer><silent> q <cmd>close!<CR>]]

-- Highlight yanked
vim.cmd [[
    augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=700})
    augroup END
]]

-- nvim lightbulb
vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
