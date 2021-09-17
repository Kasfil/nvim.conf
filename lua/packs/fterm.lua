local fterm = require("FTerm")
local nest = require("nest")

local feedkey = function(key)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "n", true)
end

fterm.setup({
    border = "double",
    dimensions = {
        height = 0.6,
        width = 0.6,
    }
})

local gitui = fterm:new({
    cmd = "gitui",
    auto_close = true,
    dimensions = {
        height = 0.9,
        width = 0.9
    }
})

nest.applyKeymaps({
    {"<A-i>", function() fterm.toggle() end},
    {mode = "t", "<A-i>", function()
        feedkey("<C-\\><C-n>")
        fterm.toggle()
    end},
    {"<A-g>", function() gitui:toggle() end},
})
