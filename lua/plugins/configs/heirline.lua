local conditions = require("heirline.conditions")
local utils = require("heirline.utils")
local pallete = require('rose-pine.palette')

local Align = { provider = "%=" }
local Space = { provider = "  " }

local colors = {
    base = pallete.base,
    overlay = pallete.overlay,
    white = pallete.text,
    red = pallete.love,
    yellow = pallete.gold,
    orange = pallete.rose,
    cyan = pallete.pine,
    blue = pallete.foam,
    magenta = pallete.iris,
    fade = pallete.muted,
}

local ViMode = {
    init = function(self)
        self.mode = vim.fn.mode(1)
    end,
    static = {
        mode_names = { -- change the strings if yow like it vvvvverbose!
            no = "NORM-SELECT",
            nov = "NORM-SELECT",
            noV = "NORM-SELECT",
            ["no^V"] = "NORM-SELECT",
            niI = "Ni",
            niR = "Nr",
            niV = "Nv",
            nt = "Nt",
            vs = "Vs",
            Vs = "Vs",
            ["^V"] = "^V",
            ["^Vs"] = "^V",
            s = "S",
            S = "S_",
            ["^S"] = "^S",
            ic = "Ic",
            ix = "Ix",
            Rc = "Rc",
            Rx = "Rx",
            Rvc = "Rv",
            Rvx = "Rv",
            cv = "Ex",
            rm = "M",
            ["r?"] = "?",
            ["!"] = "!",
            -- common
            n = "NORMAL",
            v = "VISUAL",
            V = "V-LINE",
            i = "INSERT",
            R = "REPLACE",
            Rv = "V-REPLACE",
            r = "PROMPT",
            c = "COMMAND",
            t = "TERMINAL",
        },
        mode_colors = {
            ["^V"] =  colors.orange,
            s =  colors.magenta,
            S =  colors.magenta,
            ["^S"] =  colors.magenta,
            ["!"] =  colors.red,
            n = colors.blue ,
            i = colors.yellow,
            v = colors.magenta,
            V =  colors.magenta,
            c =  colors.orange,
            R =  colors.orange,
            Rv = colors.orange,
            r =  colors.orange,
            t =  colors.red,
        }
    },

    provider = function(self)
        return " [%2("..self.mode_names[self.mode].."%)] "
    end,

    hl = function(self)
        local mode = self.mode:sub(1, 1)
        return { fg = self.mode_colors[mode] }
    end,
}

local FileNameBlock = {
    init = function(self)
        self.filename = vim.api.nvim_buf_get_name(0)
    end,
}

local FileName = {
    provider = function(self)

        local filename = vim.fn.fnamemodify(self.filename, ":.")
        if filename == "" then
            return "[No Name]"
        end

        if not conditions.width_percent_below(#filename, 0.25) then
            filename = vim.fn.pathshorten(filename)
        end
        return filename
    end,
    hl = { fg = colors.fade },
}

local FileFlags = {
{
        provider = function()
            if vim.bo.modified then
                return "[+]"
            end
        end,
        hl = { fg = colors.yellow },
    },
{
        provider = function()
            if not vim.bo.modifiable or vim.bo.readonly then
                return ""
            end
        end,
        hl = { fg = colors.orange },
    },
}

local FileNameModifer = {
    hl = function()
        if vim.bo.modified then
            return { fg = colors.yellow, style = "bold", force = true }
        end
    end,
}

FileNameBlock = utils.insert(
    FileNameBlock,
    utils.insert(FileNameModifer, FileName),
    unpack(FileFlags),
    { provider = "%<" }
)

local Diagnostics = {

    condition = conditions.has_diagnostics,

    static = {
        error_icon = " ",
        warn_icon = " ",
        info_icon = " ",
        hint_icon = " ",
    },

    init = function(self)
        self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
        self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
        self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
    end,

    {
        provider = "![",
    },
    {
        provider = function(self)
            -- 0 is just another output, we can decide to print it or not!
            return self.errors > 0 and (self.error_icon .. self.errors .. " ")
        end,
        hl = { fg = colors.red },
    },
    {
        provider = function(self)
            return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
        end,
        hl = { fg = colors.yellow },
    },
    {
        provider = function(self)
            return self.info > 0 and (self.info_icon .. self.info .. " ")
        end,
        hl = { fg = colors.blue },
    },
    {
        provider = function(self)
            return self.hints > 0 and (self.hint_icon .. self.hints)
        end,
        hl = { fg = colors.blue },
    },
    {
        provider = "]",
    },
}

local Git = {
    condition = conditions.is_git_repo,

    init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
        self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
    end,

    hl = { fg = colors.white },


    {   -- git branch name
        provider = function(self)
            return " " .. self.status_dict.head
        end,
        hl = {style = 'bold'}
    },
    -- You could handle delimiters, icons and counts similar to Diagnostics
    {
        condition = function(self)
            return self.has_changes
        end,
        provider = " "
    },
    {
        provider = function(self)
            local count = self.status_dict.added or 0
            return count > 0 and ("+" .. count .. " ")
        end,
        hl = { fg = colors.blue },
    },
    {
        provider = function(self)
            local count = self.status_dict.removed or 0
            return count > 0 and ("-" .. count .. " ")
        end,
        hl = { fg = colors.red },
    },
    {
        provider = function(self)
            local count = self.status_dict.changed or 0
            return count > 0 and ("~" .. count .. " ")
        end,
        hl = { fg = colors.yellow },
    },
    {
        condition = function(self)
            return self.has_changes
        end,
        provider = "",
    },
}

local Ruler = {
    -- %l = current line number
    -- %L = number of lines in the buffer
    -- %c = column number
    -- %P = percentage through file of displayed window
    provider = "%7(%l/%3L%):%2c",
}

local FileType = {
    provider = function()
        return "*" .. vim.bo.filetype .. "*"
    end,
    hl = { fg = utils.get_highlight("Type").fg, style = 'bold' },
}

local ScrollBar = {
    static = {
        sbar = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' }
    },
    provider = function(self)
        local curr_line = vim.api.nvim_win_get_cursor(0)[1]
        local lines = vim.api.nvim_buf_line_count(0)
        local i = math.floor(curr_line / lines * (#self.sbar - 1)) + 1
        return string.rep(self.sbar[i], 2)
    end,
    hl = {fg = colors.magenta, bg = colors.base},
}

local HelpFileName = {
    condition = function()
        return vim.bo.filetype == "help"
    end,
    provider = function()
        local filename = vim.api.nvim_buf_get_name(0)
        return vim.fn.fnamemodify(filename, ":t")
    end,
    hl = { fg = colors.blue },
}

local DAPMessages = {
    -- display the dap messages only on the debugged file
    condition = function()
        local session = require("dap").session()
        if session then
            local filename = vim.api.nvim_buf_get_name(0)
            if session.config then
                local progname = session.config.program
                return filename == progname
            end
        end
    end,
    provider = function()
        return "  " .. require("dap").status() .. " "
    end,
    hl = { bg = colors.red, fg = colors.overlay },
}

local DefaultStatusline = {
    ViMode, DAPMessages, Space, FileNameBlock, Space, Diagnostics, Align,
    FileType, Space, Git, Space, Ruler, Space, ScrollBar
}

local InactiveStatusline = {
    condition = function()
        return not conditions.is_active()
    end,

    FileName, Align,
}

local SpecialStatusline = {
    condition = function()
        return conditions.buffer_matches({
            buftype = {"nofile", "help", "quickfix"},
            filetype = {"^git.*", "fugitive"}
        })
    end,

    Align, FileType, Space, HelpFileName, Align
}

local StatusLines = {

    hl = function()
        if conditions.is_active() then
            return {
                fg = utils.get_highlight("StatusLine").fg,
                bg = utils.get_highlight("StatusLine").bg
            }
        else
            return {
                fg = utils.get_highlight("StatusLineNC").fg,
                bg = utils.get_highlight("StatusLineNC").bg
            }
        end
    end,

    stop_at_first = true,

    SpecialStatusline, InactiveStatusline, DefaultStatusline,
}

require("heirline").setup(StatusLines)
