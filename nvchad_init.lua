local map = require("core.utils").map
local customPlugins = require("core.customPlugins")
local opt = vim.opt

require("custom.autocmds")
require("custom.utils")

opt.wrap = false
opt.signcolumn = "yes"
opt.redrawtime = 1000
opt.showmode = false

-- MAPPINGS
map("n", "<space>o", "<cmd>SymbolsOutline<CR>")
map("n", "<space>g", "<cmd>Neogit <CR>")
map("t", "qq", "<cmd>lua CloseBuffer() <CR>")
map("n", "<space>q", "<cmd>lua CloseBuffer() <CR>")

-- debugger mapping
map("n", "<leader>dc", [[<cmd>lua require("dap").continue() <CR>]])
map("n", "<leader>du", [[<cmd>lua require("dap").run_last() <CR>]])
map("n", "<leader>do", [[<cmd>lua require("dap").step_over() <CR>]])
map("n", "<leader>di", [[<cmd>lua require("dap").step_into() <CR>]])
map("n", "<leader>dq", [[<cmd>lua require("dap").step_out() <CR>]])
map("n", "<leader>db", [[<cmd>lua require("dap").toggle_breakpoint() <CR>]])
map("n", "<leader>dB", [[<cmd>lua require("dap").set_breakpoint(vim.fn.input("condition: ")) <CR>]])
map("n", "<leader>dl", [[<cmd>lua require("dap").set_breakpoint(nil, nil, vim.fn.input("log point message: ")) <CR>]])
map("n", "<leader>dr", [[<cmd>lua require("dap").repl.open() <CR>]])

-- debugger widget
map("n", "<space>K", [[<cmd>lua require("dap.ui.widgets").hover() <CR>]])
map("n", "<space>ws", [[<cmd>lua require("dap.ui.widgets").sidebar(require("dap.ui.widgets").frames).open() <CR>]])
map("n", "<space>wc", [[<cmd>lua require("dap.ui.widgets").centered_float(require("dap.ui.widgets").scopes) <CR>]])

-- NOTE: opt is a variable  there (most likely a table if you want multiple options),
-- you can remove it if you dont have any custom options

customPlugins.add(function(use)
    use {"editorconfig/editorconfig-vim"}
    use {
        "simrat39/symbols-outline.nvim",
        event = {"BufRead"},
        cmd = {"SymbolsOutline"},
        config = function()
            require("custom.plugins.outline")
        end
    }
    use {
        "ggandor/lightspeed.nvim",
        event = {"BufReadPost"},
        config = function()
            local lightspeed = require("lightspeed")
            lightspeed.init_highlight(true)
            lightspeed.setup({})
        end
    }
    use {
        "blackCauldron7/surround.nvim",
        event = {"BufRead"},
        config = function()
            require("surround").setup({
                mappings_style = "surround"
            })
        end
    }
    use {
        "neovim/nvim-lspconfig",
        module = "lspconfig",

        config = function()
            require "custom.lspconfig"
        end,

        -- lazy load!
        setup = function()
            require("core.utils").packer_lazy_load "nvim-lspconfig"
            vim.defer_fn(function()
                vim.cmd 'if &ft == "packer" | echo "" | else | silent! e %'
            end, 0)
        end,
        opt = true,
    }
    use {
        "ray-x/lsp_signature.nvim",
        after = "nvim-lspconfig",
        config = function()
            require "custom.plugins.signature"
        end,
    }
    use {
        "ethanholz/nvim-lastplace",
        event = {"BufReadPre"},
        config = function()
            require("nvim-lastplace").setup({
                lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
                lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
                lastplace_open_folds = true
            })
        end
    }
    use {
        "Vimjas/vim-python-pep8-indent",
        ft = "python"
    }
    use {
        "jghauser/mkdir.nvim",
        event = {"BufNewFile"},
        config = function()
            require("mkdir")
        end
    }
    use {
        "jose-elias-alvarez/null-ls.nvim",
        after = "nvim-lspconfig",
        event = {"VimEnter"},
        config = function()
            require("custom.plugins.null-ls").setup()
        end
    }
    use {
        "rmagatti/goto-preview",
        keys = {"gpi", "gpd"},
        config = function()
            require("goto-preview").setup({
                default_mappings = true,
            })
        end
    }
    use {
        "TimUntersberger/neogit",
        requires = {"nvim-lua/plenary.nvim"},
        cmd = "Neogit",
        config = function()
            require("neogit").setup({
                signs = {
                    section = { " ", " " },
                    item = { " ", " " },
                    hunk = { " ", " " },
                }
            })
        end
    }
    use {
        "mfussenegger/nvim-dap",
        requires = {
            "mfussenegger/nvim-dap-python",
            "leoluz/nvim-dap-go",
        },
        module = {"dap"},
        config = function()
            require("custom.plugins.dap")
        end
    }
    use {
        "mizlan/iswap.nvim",
        cmd = "ISwap",
        config = function()
            require("iswap").setup({
                autoswap = true,
            })
        end
    }
    use {
        "NTBBloodbath/rest.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        event = "BufReadPost",
        config = function()
            require("rest-nvim").setup()
        end
    }
end)
