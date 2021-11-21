local dap = require("dap")
local widget = require("dap.ui.widgets")
local wk = require("which-key")

-- Python dap configuration
require("dap-python").setup("python")
table.insert(dap.configurations.python, {
    name = "Select and launch file",
    type = "python",
    request = "launch",
    program = function()
        local filepath = vim.fn.input("File path relative workspace: ")
        return "${workspaceFolder}/" .. filepath
    end,
    args = function()
        local args_string = vim.fn.input('Arguments: ')
        return vim.split(args_string, " +")
    end,
    console = "integratedTerminal"
})
table.insert(dap.configurations.python, {
    name = "Fastapi uvicorn",
    type = "python",
    request = "launch",
    module = "uvicorn",
    args = {
        "index:app",
        "--reload",
        "--reload-exclude",
        "logs/",
        "--reload-exclude",
        ".docker/"
    },
    console = "integratedTerminal"
})

wk.register({
    ["<leader>d"] = {
        name = "debugger",
        c = { function() dap.continue() end, "start / continue debugger" },
        b = { function() dap.toggle_breakpoint() end, "toggle break point" },
        B = { function() dap.set_breakpoint(vim.fn.input("Condition")) end, "toggle conditional break point" },
        rp = { function() dap.repl.open() end, "open dap repl" },
        rl = { function() dap.run_last() end, "run last debugging profile" },
        K = { function() widget.hover() end, "inspect value under cursor" },
        wb = { function() widget.sidebar(widget.frames).open() end, "open sidebar widget frames" },
        wc = { function() widget.centered_float(widget.scopes) end, "open float widget scope" },
    }
})

-- other things
vim.cmd([[au FileType dap-repl lua require('dap.ext.autocompl').attach()]])
vim.fn.sign_define("DapBreakpoint", {text=" ", texthl="", linehl="", numhl=""})
