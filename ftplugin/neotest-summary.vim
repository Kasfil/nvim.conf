setlocal winhighlight=Normal:SideWin
setlocal nolist

nnoremap <silent><buffer> q :lua require("neotest").summary.close() <CR>
