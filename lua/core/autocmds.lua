-- close dap-float filetypes with q
vim.cmd [[autocmd FileType dap-float nnoremap <buffer><silent> q <cmd>close!<CR>]]
vim.cmd [[autocmd FileType qf nnoremap <buffer><silent> q <cmd>close!<CR>]]

-- fugitive buffer mapping
vim.cmd [[autocmd FileType fugitive nnoremap <buffer><silent> q <cmd>close!<CR>]]
vim.cmd [[autocmd FileType fugitive nnoremap <buffer> co<space> :Git switch ]]
vim.cmd [[autocmd FileType fugitive nnoremap <buffer><silent><nowait> cP<space> <cmd>Dispatch! git -c push.default=current push<CR>]]
vim.cmd [[autocmd FileType fugitive nnoremap <buffer><silent><nowait> cp<space> <cmd>Dispatch git fetch<CR>]]
vim.cmd [[autocmd FileType gitcommit nnoremap <buffer><silent> q <cmd>close!<CR>]]
vim.cmd [[autocmd FileType git nnoremap <buffer><silent> q <cmd>close!<CR>]]

-- Highlight yanked
vim.cmd [[
    augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=700})
    augroup END
]]
