local neotest = require("neotest")

neotest.setup({
    adapters = {
        require("neotest-python"),
        require("neotest-go"),
        require("neotest-plenary"),
    },
    floating = { border = "single" },
    icons = {
        expanded = "┐",
        final_child_prefix = "└",
        passed = "✓",
    },
})

vim.api.nvim_create_user_command(
    "NeotestSummaryToggle",
    function() neotest.summary.toggle() end,
    {}
)

vim.api.nvim_create_user_command(
    "NeotestRunSuite",
    function() neotest.run.run({ suite = true }) end,
    {}
)

vim.api.nvim_create_user_command(
    "NeotestRunFile",
    function() neotest.run.run(vim.fn.expand("%")) end,
    {}
)

vim.api.nvim_create_user_command(
    "NeotestRunNearest",
    function() neotest.run.run({}) end,
    {}
)

vim.api.nvim_create_user_command(
    "NeotestRunLast",
    function() neotest.run.run_last({}) end,
    {}
)

vim.api.nvim_create_user_command(
    "NeotestDebugNearest",
    function() neotest.run.run({ strategy = "dap" }) end,
    {}
)

vim.api.nvim_create_user_command(
    "NeotestDebugLast",
    function() neotest.run.run_last({ strategy = "dap" }) end,
    {}
)
