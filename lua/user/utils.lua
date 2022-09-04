local util = {}

util.send_key = function(key)
  vim.api.nvim_replace_termcodes(key, true, true, true)
end

util.close_window = function()
  if vim.bo.buftype == "terminal" then
    vim.cmd("ToggleTerm")
  else
    vim.cmd("q")
  end
end

util.map = function(mode, key, action, options)
  if options == nil then
    options = {}
  end

  local default_options = { noremap = true, silent = true }
  vim.keymap.set(mode, key, action, vim.tbl_deep_extend("force", default_options, options))
end

return util
