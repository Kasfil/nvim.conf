local Terminal = require("toggleterm.terminal").Terminal
local wk = require("which-key")

require("toggleterm").setup({
    shade_terminals = true,
    size = 13,
    direction = "horizontal",
    float_opts = {
        border = "single",
    }
})

local lazygit = Terminal:new({
    cmd = "lazygit",
    direction = "float",
    hidden = true,
    close_on_exit = true
})

function _Lazygit()
    lazygit:toggle()
end

wk.register({
    ["<leader>t"] = {
        name = "Terminal",
        g = { function() _Lazygit() end, "open lazygit" },
        t = { "<Esc><cmd>ToggleTerm<CR>", "toggle terminal" }
    }
})

-- idk why i can't using list in mode
-- unfortunately must redefine the mapping
wk.register({
    ["<leader>tt"] = { "<Esc><cmd>ToggleTerm<CR>", "toggle terminal" }
}, {
    mode = "t"
})
