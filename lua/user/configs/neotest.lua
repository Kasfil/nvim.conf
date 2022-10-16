import({ "neotest", "neotest-plenary", "neotest-python", "neotest-go" }, function(mods)
  local neotest = mods.neotest
  local neopython = mods["neotest-python"]
  local neogo = mods["neotest-go"]
  local neoplenary = mods["neotest-plenary"]

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
    neotest.summary.open()
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
