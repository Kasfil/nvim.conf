local dap = require("dap")
local pydap = require("dap-python")

vim.cmd [[ au FileType dap-repl lua require('dap.ext.autocompl').attach() ]]

-- dap external terminal fallback
dap.defaults.fallback.external_terminal = {
    command = "alacritty",
    args = {
        "-t",
        "Nvim-Dap",
        "-e"
    },
}

-- debugging signs
vim.fn.sign_define("DapBreakpoint", {text=" ", texthl="Error", linehl="", numhl=""})
vim.fn.sign_define("DapBreakpointCondition", {text="⯁ ", texthl="Error", linehl="", numhl=""})
vim.fn.sign_define("DapLogPoint", {text="⯁ ", texthl="Error", linehl="", numhl=""})
vim.fn.sign_define("DapBreakpointRejected", {text=" ", texthl="Error", linehl="", numhl=""})
vim.fn.sign_define("DapStopped", {text=" ", texthl="", linehl="debugPC", numhl=""})

-- dap go initialization
require("dap-go").setup()

-- setting dap-python
pydap.setup("python")
pydap.test_runner = "pytest"

table.insert(dap.configurations.python, {
    name = "Exec file",
    type = "python",
    request = "launch",
    program = function()
        local app = vim.fn.input("filename: ")
        return "${workspaceFolder}/" .. app
    end,
    args = function()
        local args_string = vim.fn.input("Arguments: ")
        return vim.split(args_string, " +")
    end,
})

table.insert(dap.configurations.python, {
    name = "Django",
    type = "python",
    request = "launch",
    program = vim.fn.getcwd() .. "/manage.py",
    args = { "runserver", "--noreload" },
})

table.insert(dap.configurations.go, {
    name = "Run Main",
    type = "go",
    request = "launch",
    program = "${workspaceFolder}" .. "/main.go"
})
