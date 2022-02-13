-- close dap-float filetypes with q
vim.cmd [[autocmd FileType dap-float nnoremap <buffer><silent> q <cmd>close!<CR>]]
vim.cmd [[autocmd FileType qf nnoremap <buffer><silent> q <cmd>close!<CR>]]
vim.cmd [[autocmd FileType fugitive nnoremap <buffer><silent> q <cmd>close!<CR>]]
