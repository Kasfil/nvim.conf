import({ "cmp", "luasnip", "neogen", "nvim-autopairs.completion.cmp", "nvim-autopairs" }, function(mods)
  local cmp = mods.cmp
  local luasnip = mods.luasnip
  local cmp_autopairs = mods["nvim-autopairs.completion.cmp"]
  local neogen = mods.neogen

  mods["nvim-autopairs"].setup()

  local cmp_kinds = {
    Text = "  ",
    Method = "  ",
    Function = "  ",
    Constructor = "  ",
    Field = "  ",
    Variable = "  ",
    Class = "  ",
    Interface = "  ",
    Module = "  ",
    Property = "  ",
    Unit = "  ",
    Value = "  ",
    Enum = "  ",
    Keyword = "  ",
    Snippet = "  ",
    Color = "  ",
    File = "  ",
    Reference = "  ",
    Folder = "  ",
    EnumMember = "  ",
    Constant = "  ",
    Struct = "  ",
    Event = "  ",
    Operator = "  ",
    TypeParameter = "  ",
  }

  local has_word_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
      return false
    end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "luasnip" },
      { name = "path" },
      { name = "buffer" },
    },
    mapping = {
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif neogen.jumpable() then
          neogen.jump_next()
        elseif luasnip.expand_or_locally_jumpable() then
          luasnip.expand_or_jump()
        elseif has_word_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif neogen.jumpable(-1) then
          neogen.jump_prev()
        elseif luasnip.expand_or_locally_jumpable(-1) then
          luasnip.expand_or_jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<C-b>"] = cmp.mapping(function(_)
        if luasnip.choice_active() then
          luasnip.change_choice(-1)
        else
          cmp.mapping.scroll_docs(-4)
        end
      end, { "i", "c" }),
      ["<C-f>"] = cmp.mapping(function(_)
        if luasnip.choice_active() then
          luasnip.change_choice(1)
        else
          cmp.mapping.scroll_docs(4)
        end
      end, { "i", "c" }),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ["<C-e>"] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ["<CR>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = false,
      }),
    },
    formatting = {
      format = function(_, vim_item)
        vim_item.kind = (cmp_kinds[vim_item.kind] or "") .. vim_item.kind
        return vim_item
      end,
    },
  })

  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end)
