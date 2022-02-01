-- close dap-float filetypes with q
vim.cmd [[autocmd FileType dap-float nnoremap <buffer><silent> q <cmd>close!<CR>]]

vim.api.nvim_exec([[
augroup SideWindowsBG
    autocmd!
    autocmd BufWinEnter,BufWinLeave * call Set_BG()
augroup END

function! Set_BG()
    if &filetype == "Outline"
        setlocal signcolumn=no
        setlocal winhighlight=Normal:SideWin
    endif
endfunction

]], true)
