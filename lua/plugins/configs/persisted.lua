require("persisted").setup({
    autoload = true,
    before_save = function()
        local cmds = {
            "NvimTreeClose",
            "SymbolsOutlineClose"
        }

        for _, cmd in ipairs(cmds) do
            vim.cmd(cmd)
        end
    end
})
