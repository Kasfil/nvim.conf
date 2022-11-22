import({ "lualine", "dap", "nvim-navic", "catppuccin.palettes", "plenary.job" }, function(mods)
  local navic = mods["nvim-navic"]
  local dap = mods.dap
  local pallete = mods["catppuccin.palettes"].get_palette()
  local job = mods["plenary.job"]

  -- [[
  -- this code stolen from https://www.reddit.com/r/neovim/comments/t48x5i/comment/hyx6fkl/?utm_source=share&utm_medium=web2x&context=3
  local gstatus = { ahead = 0, behind = 0 }
  local function update_gstatus()
    job
      :new({
        command = "git",
        args = { "rev-list", "--left-right", "--count", "HEAD...@{upstream}" },
        on_exit = function(fetch, _)
          local res = fetch:result()[1]
          if type(res) ~= "string" then
            gstatus = { ahead = 0, behind = 0 }
            return
          end
          local ok, ahead, behind = pcall(string.match, res, "(%d+)%s*(%d+)")
          if not ok then
            ahead, behind = 0, 0
          end
          gstatus = { ahead = ahead, behind = behind }
        end,
      })
      :start()
  end

  if _G.Gstatus_timer == nil then
    _G.Gstatus_timer = vim.loop.new_timer()
  else
    _G.Gstatus_timer:stop()
  end

  _G.Gstatus_timer:start(0, 2000, vim.schedule_wrap(update_gstatus))
  -- ]]

  mods.lualine.setup({
    options = {
      icons_enabled = true,
      theme = "catppuccin",
      section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
      globalstatus = true,
      disabled_filetypes = {
        statusline = { "packer", "toggleterm" },
        winbar = {
          "",
          "NeogitBranHelpchSelectView",
          "NeogitBranchSelectView",
          "NeogitBranchSelectView",
          "NeogitCommitMessage",
          "NeogitCommitSelectView",
          "NeogitCommitView",
          "NeogitHelpPopup",
          "NeogitLogView",
          "NeogitNotification",
          "NeogitPopup",
          "NeogitRebaseTodo",
          "NeogitStatus",
          "NeogitStatusNew",
          "NvimTree",
          "Outline",
          "Trouble",
          "dap-repl",
          "packer",
          "qf",
          "toggleterm",
        },
      },
    },
    sections = {
      lualine_a = {},
      lualine_b = {
        {
          function()
            return "  DAP mode active"
          end,
          cond = function()
            return dap.session() ~= nil
          end,
          color = "DapStatusLine",
        },
      },
      lualine_c = {
        {
          function()
            return "█"
          end,
          color = { fg = pallete.teal },
          padding = { left = 0, right = 1 },
        },
        { "filetype", color = { fg = pallete.yellow, gui = "bold" } },
        {
          "filename",
          path = 1,
        },
        {
          "diagnostics",
          sources = { "nvim_diagnostic" },
          symbols = { error = "E", warn = "W", info = "I", hint = "H" },
          sections = { "error", "warn", "info", "hint" },
        },
        {
          "lsp_progress",
          colors = {
            percentage = pallete.yellow,
            title = pallete.mauve,
            message = pallete.text,
            spinner = pallete.text,
            lsp_client_name = pallete.flamingo,
            use = true,
          },
          separators = {
            component = " ",
            progress = " | ",
            message = { pre = "(", post = ")" },
            percentage = { pre = "", post = "%% " },
            title = { pre = "", post = ": " },
            lsp_client_name = { pre = "[", post = "]" },
            spinner = { pre = "", post = "" },
          },
          display_components = { "lsp_client_name", { "title", "percentage", "message" } },
          timer = { progress_enddelay = 500, spinner = 500, lsp_client_name_enddelay = 500 },
          message = { commenced = "In Progress", completed = "Completed" },
          max_message_length = 30,
        },
      },
      lualine_x = {
        -- {
        --   function()
        --     local recording = vim.fn.reg_recording()
        --     return "Recording: " .. recording
        --   end,
        --   cond = function()
        --     return vim.fn.reg_recording() ~= ""
        --   end,
        --   color = { fg = pallete.yellow, gui = "bold" },
        --   padding = { right = 1 },
        -- },
        {
          "diff",
          colored = true,
          symbols = {
            added = "+",
            modified = "~",
            removed = "-",
          },
        },
        {
          function()
            return gstatus.ahead .. "↑ " .. gstatus.behind .. "↓"
          end,
        },
        {
          "branch",
          icon = "",
          color = { fg = pallete.peach, gui = "bold" },
        },
        {
          "location",
          color = { fg = pallete.blue },
        },
      },
      lualine_y = {},
      lualine_z = {},
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    -- tabline = {},
    winbar = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {
        function()
          local win_number = "[" .. vim.api.nvim_win_get_number(0) .. "]"
          local file = vim.call("expand", "%:t")
          local prefix = win_number .. " " .. "%#WinBarFileIcon# %*%#WinBarFile#" .. file .. "%*"
          if navic.get_location() ~= "" then
            return prefix .. "%#NavicSeparator# > %*" .. navic.get_location()
          else
            return prefix
          end
        end,
      },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    inactive_winbar = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {
        function()
          local win_number = "[" .. vim.api.nvim_win_get_number(0) .. "]"
          local file = vim.call("expand", "%:t")
          local prefix = win_number .. " " .. "%#WinBarFileIcon# %*%#WinBarFile#" .. file .. "%*"
          if navic.get_location() ~= "" then
            return prefix .. "%#NavicSeparator# > %*" .. navic.get_location()
          else
            return prefix
          end
        end,
      },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    extensions = { "nvim-tree" },
  })
end)
