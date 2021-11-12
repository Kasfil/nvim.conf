local dap = require("dap")
local dapins = require("dap-install")

vim.fn.sign_define("DapBreakpoint", {text=" ", texthl="", linehl="", numhl=""})

dapins.setup({
    installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
})

-- python
dap.adapters.python = {
    type = "executable",
    command = "python",
    args = {"-m", "debugpy.adapter"},
}

dap.configurations.python = {
    {
        type = "python",
        request = "launch",
        name = "FastAPI",
        program = vim.fn.getcwd() .. "/fastapidebug.py",
        pythonPath = function()
            return "python"
        end
    }
}
