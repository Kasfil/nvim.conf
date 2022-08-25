---@diagnostic disable: lowercase-global
import("neotest", function(neotest)
  neopython = nil
  neogo = nil
  neoplenary = nil

  import("neotest-python", function(nt_python)
    neopython = nt_python
  end)
  import("neotest-go", function(nt_go)
    neogo = nt_go
  end)
  import("neotest-plenary", function(nt_plenary)
    neoplenary = nt_plenary
  end)

  neotest.setup({
    adapters = {
      neopython,
      neogo,
      neoplenary,
    },
    floating = { border = "single" },
    icons = {
      expanded = "┐",
      final_child_prefix = "└",
      passed = "✓",
    },
  })

  vim.api.nvim_create_user_command("NeotestSummaryToggle", function()
    neotest.summary.toggle()
  end, {})

  vim.api.nvim_create_user_command("NeotestRunSuite", function()
    neotest.run.run({ suite = true })
  end, {})

  vim.api.nvim_create_user_command("NeotestRunFile", function()
    neotest.run.run(vim.fn.expand("%"))
  end, {})

  vim.api.nvim_create_user_command("NeotestRunNearest", function()
    neotest.run.run({})
  end, {})

  vim.api.nvim_create_user_command("NeotestRunLast", function()
    neotest.run.run_last({})
  end, {})

  vim.api.nvim_create_user_command("NeotestDebugNearest", function()
    neotest.run.run({ strategy = "dap" })
  end, {})

  vim.api.nvim_create_user_command("NeotestDebugLast", function()
    neotest.run.run_last({ strategy = "dap" })
  end, {})
end)
