local t = function (str)
    vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.CloseBuffer()
    if vim.bo.buftype == "terminal" then
        t("<C-\\><C-n>")
        vim.cmd([[bd!]])
    else
        vim.cmd("q")
    end
end
