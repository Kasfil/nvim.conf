-- close dap-float filetypes with q
vim.cmd [[autocmd FileType dap-float nnoremap <buffer><silent> q <cmd>close!<CR>]]
vim.cmd [[autocmd FileType qf nnoremap <buffer><silent> q <cmd>close!<CR>]]

-- fugitive buffer mapping
vim.cmd [[autocmd FileType fugitive nnoremap <buffer><silent> q <cmd>close!<CR>]]
vim.cmd [[autocmd FileType fugitive nnoremap <buffer><silent><nowait> gPp <cmd>Git! -c push.default=current push<CR>]]
vim.cmd [[autocmd FileType fugitive nnoremap <buffer><silent><nowait> gpp <cmd>Dispatch git fetch<CR>]]
vim.cmd [[autocmd FileType gitcommit nnoremap <buffer><silent> q <cmd>close!<CR>]]
vim.cmd [[autocmd FileType git nnoremap <buffer><silent> q <cmd>close!<CR>]]
