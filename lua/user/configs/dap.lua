import({ "dap", "dap-python", "dap-go" }, function(mods)
  local dap = mods.dap
  local pydap = mods["dap-python"]
  local map = require("user.utils").map
  local autocmd = vim.api.nvim_create_autocmd
  local dapwidget = require("dap.ui.widgets")

  autocmd("FileType", {
    pattern = "dap-repl",
    callback = function()
      vim.opt_local.relativenumber = false
      vim.opt_local.number = false
      vim.opt_local.signcolumn = "no"

      require("dap.ext.autocompl").attach()
    end,
  })

  -- dap external terminal fallback
  dap.defaults.fallback.external_terminal = {
    command = "kitty",
    args = {
      "-t",
      "Nvim-Dap",
      "-e",
    },
  }

  -- dap integrated terminal window config
  dap.defaults.fallback.terminal_win_cmd = [[45 new]]

  -- debugging signs
  vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "Error", linehl = "", numhl = "" })
  vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "Error", linehl = "", numhl = "" })
  vim.fn.sign_define("DapLogPoint", { text = "", texthl = "Error", linehl = "", numhl = "" })
  vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "Error", linehl = "", numhl = "" })
  vim.fn.sign_define("DapStopped", { text = "", texthl = "", linehl = "debugPC", numhl = "" })

  -- dap go initialization
  mods["dap-go"].setup()

  -- setting dap-python
  pydap.setup("python")
  pydap.test_runner = "pytest"

  table.insert(dap.configurations.python, {
    name = "Exec file",
    type = "python",
    request = "launch",
    console = "integratedTerminal",
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
    console = "integratedTerminal",
    program = vim.fn.getcwd() .. "/manage.py",
    args = { "runserver", "--noreload" },
  })

  table.insert(dap.configurations.go, {
    name = "Run Main",
    type = "go",
    request = "launch",
    program = "${workspaceFolder}" .. "/main.go",
  })

  -- debugger mapping
  map("n", "<F5>", function()
    dap.continue()
  end)
  map("n", "<F17>", function()
    dap.terminate()
  end)
  map("n", "<F4>", function()
    dap.run_last()
  end)
  map("n", "<F10>", function()
    dap.step_over({})
  end)
  map("n", "<F9>", function()
    dap.step_into()
  end)
  map("n", "<F21>", function()
    dap.step_out()
  end)
  map("n", "<leader>dc", function()
    dap.clear_breakpoints()
  end)
  map("n", "<leader>db", function()
    dap.toggle_breakpoint()
  end)
  map("n", "<leader>dB", function()
    dap.set_breakpoint(vim.fn.input("condition: "))
  end)
  map("n", "<leader>dl", function()
    dap.set_breakpoint(nil, nil, vim.fn.input("log point message: "))
  end)
  map("n", "<leader>dr", function()
    dap.repl.open()
  end)
  -- debugger widget
  map("n", "<space>K", function()
    dapwidget.hover()
  end)
  map("n", "<space>ws", function()
    dapwidget.sidebar(dapwidget.frames).open()
  end)
  map("n", "<space>wc", function()
    dapwidget.centered_float(dapwidget.scopes)
  end)
end)
