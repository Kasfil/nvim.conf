import("go", function(gonvim)
  gonvim.setup({
    icons = false,
    dap_debug_keymap = false,
    comment_placeholder = ": ",
    lsp_keymaps = false,
    lsp_inlay_hints = {
      enable = true,
    },
  })
end)
