require("persisted").setup({
    autoload = true,
    autosave = true,
    before_save = function()
        local cmds = {
            "NvimTreeClose",
            "SymbolsOutlineClose"
        }

        for _, cmd in ipairs(cmds) do
            vim.notify("running " .. cmd, "warning")
            -- prevent error
            pcall(function() vim.cmd(cmd) end)
        end
    end
})
