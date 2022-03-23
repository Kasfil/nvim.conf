local dap = require("dap")

-- [[
-- this code stolen from https://www.reddit.com/r/neovim/comments/t48x5i/comment/hyx6fkl/?utm_source=share&utm_medium=web2x&context=3
local gstatus = { ahead = 0, behind = 0 }
local function update_gstatus()
    require("plenary.job"):new({
        command = "git",
        args = {"rev-list", "--left-right", "--count", "HEAD...@{upstream}"},
        on_exit = function(job, _)
            local res = job:result()[1]
            if type(res) ~= "string" then gstatus = {ahead = 0, behind = 0}; return end
            local ok, ahead, behind = pcall(string.match, res, "(%d+)%s*(%d+)")
            if not ok then ahead, behind = 0, 0 end
            gstatus = { ahead = ahead, behind = behind }
        end
    }):start()
end

if _G.Gstatus_timer == nil then
    _G.Gstatus_timer = vim.loop.new_timer()
else
    _G.Gstatus_timer:stop()
end
_G.Gstatus_timer:start(0, 2000,  vim.schedule_wrap(update_gstatus))
-- ]]

require"lualine".setup {
    options = {
        icons_enabled = true,
        theme = "kanagawa",
        section_separators = {left = "", right = ""},
        component_separators = {left = "", right = ""},
        disabled_filetypes = {"packer", "toggleterm"},
        globalstatus = true,
    },
    sections = {
        lualine_a = {"mode"},
        lualine_b = {
            {
                function() return "  DAP mode active" end,
                cond = function()
                    return dap.session() ~= nil
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
                sources = {"nvim_diagnostic"},
                symbols = {error = "E", warn = "W", info = "I", hint = "H"},
                sections = {"error", "warn", "info", "hint"}
            },
        },
        lualine_x = {
            {
                "diff",
                colored = true,
                symbols = {
                    added = "+",
                    modified = "~",
                    removed = "-"
                },
            },
            { function() return gstatus.ahead.."↑ "..gstatus.behind.."↓" end },
        },
        lualine_y = {{"branch", icon = ""}},
        lualine_z = {"location"}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {"filename"},
        lualine_x = {"location"},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {"nvim-tree"}
}
