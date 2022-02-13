local a = require("plenary.async")
local M = {}

M.file_exists = function(file)
    local f = io.open(file, "r")

    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end

M.asyncGitPush = function()
    a.run(
        vim.cmd("Git push"),
        function()
            print("cannot run git push")
        end
    )
end

M.send_key = function (key)
    vim.api.nvim_replace_termcodes(key, true, true, true)
end

M.close_window = function()
    if vim.bo.buftype == "terminal" then
        M.send_key("<C-\\><C-n>")
        vim.cmd("ToggleTerm")
    else
        vim.cmd("q")
    end
end


return M
