---@diagnostic disable: lowercase-global
import("lualine", function(lualine)
  dap_status = nil
  navic = nil

  import("dap", function(_)
    dap_status = _
  end)

  import("nvim-navic", function(_)
    navic = _
  end)

  -- [[
  -- this code stolen from https://www.reddit.com/r/neovim/comments/t48x5i/comment/hyx6fkl/?utm_source=share&utm_medium=web2x&context=3
  local gstatus = { ahead = 0, behind = 0 }
  local function update_gstatus()
    require("plenary.job")
      :new({
        command = "git",
        args = { "rev-list", "--left-right", "--count", "HEAD...@{upstream}" },
        on_exit = function(job, _)
          local res = job:result()[1]
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

  lualine.setup({
    options = {
      icons_enabled = true,
      theme = "catppuccin",
      section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
      globalstatus = true,
      disabled_filetypes = {
        statusline = { "packer", "toggleterm" },
        winbar = {
          "packer",
          "toggleterm",
          "Outline",
          "NvinTree",
          "",
          "dap-repl",
          "Trouble",
          "NeogitStatus",
          "NeogitPopup",
          "NeogitHelpPopup",
          "NeogitNotification",
          "NeogitCommitSelectView",
          "NeogitCommitMessage",
          "NeogitRebaseTodo",
          "NeogitStatusNew",
          "NeogitBranHelpchSelectView",
          "NeogitBranchSelectView",
          "NeogitBranchSelectView",
          "NeogitCommitView",
          "NeogitLogView",
        },
      },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = {
        {
          function()
            return "  DAP mode active"
          end,
          cond = function()
            return dap_status.session() ~= nil
          end,
          color = "DapStatusLine",
        },
        "filetype",
      },
      lualine_c = {
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
      },
      lualine_x = {
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
          "import",
          function()
            return gstatus.ahead .. "↑ " .. gstatus.behind .. "↓"
          end,
        },
      },
      lualine_y = { { "branch", icon = "" } },
      lualine_z = { "location" },
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
