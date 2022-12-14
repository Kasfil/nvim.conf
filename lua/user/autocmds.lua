local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local map = require("user.utils").map

-- close window with q
autocmd("FileType", {
  pattern = { "dap-float", "qf", "git", "fugitive", "gitcommit" },
  command = "nnoremap <buffer><silent> q <cmd>close!<CR>",
})

-- Highlight yanked
local hi_yanked = augroup("HighlightYanked", { clear = true })
autocmd("TextYankPost", {
  group = hi_yanked,
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 750 })
  end,
})

local leap_on = augroup("LeapOn", { clear = true })
autocmd({ "User LeapEnter" }, {
  group = leap_on,
  pattern = "*",
  command = "let g:leap_active = 1",
})
autocmd({ "User LeapLeave" }, {
  group = leap_on,
  pattern = "*",
  callback = function()
    if vim.g.leap_active ~= nil then
      vim.api.nvim_del_var("leap_active")
    end
  end,
})

-- set terminal keymap
autocmd({ "TermOpen" }, {
  pattern = { "term://*", "*" },
  callback = function()
    local opt = { buffer = 0 }
    map("t", "<esc>", [[<C-\><C-n>]], opt)
    map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opt)
    map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opt)
    map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opt)
    map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opt)
  end,
})
