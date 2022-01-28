local dap = require("dap")
local pydap = require("dap-python")

vim.cmd [[ au FileType dap-repl lua require('dap.ext.autocompl').attach() ]]

-- dap external terminal fallback
dap.defaults.fallback.external_terminal = {
    command = "alacritty",
    args = {
        "-o",
        "window.decorations=none",
        "-e"
    },
}

-- force to use external terminal
dap.defaults.fallback.force_external_terminal = true

-- debugging signs
vim.fn.sign_define("DapBreakpoint", {text=" ", texthl="", linehl="", numhl=""})
vim.fn.sign_define("DapBreakpointCondition", {text=" ", texthl="", linehl="", numhl=""})
vim.fn.sign_define("DapLogPoint", {text=" ", texthl="", linehl="", numhl=""})
vim.fn.sign_define("DapBreakpointRejected", {text=" ", texthl="", linehl="", numhl=""})
vim.fn.sign_define("DapStopped", {text=" ", texthl="", linehl="debugPC", numhl=""})

-- setting dap-python
pydap.setup("python", { console = "externalTerminal" })
pydap.test_runner = "pytest"

table.insert(dap.configurations.python, {
    name = "uvicorn",
    type = "python",
    request = "launch",
    module = "uvicorn",
    args = function()
        local args = {}

        -- app name
        local app = vim.fn.input("app (index:app): ")
        if app == "" then
            app = "index:app"
        end
        table.insert(args, app)

        -- port to run
        local port = vim.fn.input("port (8000): ")
        if (port == nil or port == "") then
            port = 8000
        else
            port = tonumber(port)
        end
        table.insert(args, "--port=" .. port)

        -- ask should enable reload?
        local reload = vim.fn.input("enable reload? (y/N): ")
        local reload_exclude = {".*", "tmp", "log*"}
        if string.lower(reload) == "y" then
            -- enable reload
            table.insert(args, "--reload")
            table.insert(args, "--reload-delay=0.5")
            -- exclude regular excluded file and folder
            for _, item in pairs(reload_exclude) do
                table.insert(args, "--reload-exclude=" .. item)
            end
        end

        return args
    end,
    console = "externalTerminal",
})

table.insert(dap.configurations.python, {
    name = "Django",
    type = "python",
    request = "launch",
    program = "${workspaceFolder}/manage.py",
    args = {"runserver", "--noreload", "--nothreading"},
    autoReload = {enable = true},
    console = "externalTerminal",
})

dap.listeners.after["event_debugpyAttach"]["dap-python"] = function(_, config)
    local session = require("dap.session"):connect(config.connect, {}, vim.inspect)
    session:initialize(config)
    dap.set_session(session)
end

-- dap go initialization
require("dap-go").setup()
