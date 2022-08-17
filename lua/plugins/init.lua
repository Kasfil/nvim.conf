local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
        "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
        install_path
    })
    vim.cmd("packadd packer.nvim")
end

local config = {
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "single" })
        end
    },
    compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
}

local packer = require("packer")
return packer.startup({
    function(use)
        -- ensure packer is not removed
        use { "wbthomason/packer.nvim" }
        use {
            "lewis6991/impatient.nvim",
            config = function()
                require("impatient")
            end
        }

        -- syntax highlighting
        use {
            "nvim-treesitter/nvim-treesitter",
            config = function()
                require("plugins.configs.treesitter")
            end
        }

        -- git integration
        use {
            "lewis6991/gitsigns.nvim",
            requires = { "nvim-lua/plenary.nvim" },
            event = "VimEnter",
            config = function()
                require("plugins.configs.gitsigns")
            end
        }
        use {
            "TimUntersberger/neogit",
            requires = "nvim-lua/plenary.nvim",
            cmd = { "Neogit" },
            config = function()
                require("neogit").setup({
                    disable_commit_confirmation = false,
                    signs = {
                        section = { " ", " " },
                        item = { " ", " " },
                        hunk = { " ", " " },
                    },
                    integrations = {
                        diffview = true,
                    }
                })
            end
        }
        use {
            "akinsho/git-conflict.nvim",
            config = function()
                require("git-conflict").setup()
            end
        }

        -- lsp stuff
        use {
            "hrsh7th/nvim-cmp",
            module = { "cmp", "cmp_nvim_lsp" },
            event = { "InsertEnter" },
            config = function()
                require("plugins.configs.cmp-nvim")
            end
        }
        use {
            "windwp/nvim-autopairs",
            module = "nvim-autopairs.completion.cmp",
        }
        use {
            "L3MON4D3/LuaSnip",
            requires = { "rafamadriz/friendly-snippets" },
            event = "VimEnter",
            config = function()
                require("plugins.configs.luasnip")
            end
        }
        use { "saadparwaiz1/cmp_luasnip", after = "LuaSnip" }
        use { "hrsh7th/cmp-nvim-lua" }
        use { "hrsh7th/cmp-nvim-lsp" }
        use { "hrsh7th/cmp-buffer" }
        use { "hrsh7th/cmp-path" }
        use {
            "ray-x/lsp_signature.nvim",
            after = "nvim-lspconfig",
            config = function()
                require("plugins.configs.lspsignature")
            end
        }
        use {
            "neovim/nvim-lspconfig",
            event = "BufReadPre",
            config = function()
                require("plugins.configs.lspconfig")
            end
        }
        use {
            "jose-elias-alvarez/null-ls.nvim",
            event = "BufReadPost",
            requires = { "nvim-lua/plenary.nvim" },
            config = function()
                require("plugins.configs.null-ls")
            end
        }
        use {
            "folke/lsp-trouble.nvim",
            requires = { "kyazdani42/nvim-web-devicons" },
            cmd = { "TroubleToggle" },
            config = function()
                require("plugins.configs.trouble")
            end
        }
        use {
            "rmagatti/goto-preview",
            keys = { "gpd", "gpi" },
            config = function()
                require("plugins.configs.goto-preview")
            end
        }
        use {
            "j-hui/fidget.nvim",
            after = "nvim-lspconfig",
            config = function()
                require("fidget").setup({
                    text = {
                        spinner = "dots_snake",
                        done = "✓",
                    }
                })
            end
        }

        -- utilities
        use {
            "numToStr/Comment.nvim",
            event = { "BufReadPost" },
            config = function()
                require("Comment").setup()
            end
        }
        use {
            "lukas-reineke/virt-column.nvim",
            event = { "BufRead" },
            config = function()
                require("plugins.configs.virtcolumn")
            end
        }
        use {
            "danymat/neogen",
            after = "nvim-treesitter",
            module = { "neogen" },
            cmd = { "Neogen" },
            config = function()
                require('neogen').setup {
                    enabled = true
                }
            end,
            requires = "nvim-treesitter/nvim-treesitter"
        }
        use {
            "ggandor/leap.nvim",
            event = "BufReadPost",
            config = function()
                local leap = require("leap")
                leap.setup({})
                leap.set_default_keymaps()
                leap.init_highlight()
            end
        }
        use {
            "kyazdani42/nvim-tree.lua",
            cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeRefresh", "NvimTreeClose" },
            requires = { "kyazdani42/nvim-web-devicons" },
            config = function()
                require("plugins.configs.nvimtree")
            end
        }
        use {
            "kylechui/nvim-surround",
            event = { "BufReadPost" },
            config = function()
                require("plugins.configs.nvim-surround")
            end
        }
        use {
            "ethanholz/nvim-lastplace",
            event = { "BufRead" },
            config = function()
                require("nvim-lastplace").setup({
                    lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
                    lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
                    lastplace_open_folds = true
                })
            end
        }
        use {
            "nvim-telescope/telescope.nvim",
            requires = { "nvim-lua/plenary.nvim" },
            cmd = "Telescope",
            config = function()
                require("plugins.configs.telescope")
            end
        }
        use {
            "simrat39/symbols-outline.nvim",
            cmd = { "SymbolsOutline", "SymbolsOutlineClose" },
            config = function()
                require("plugins.configs.outline")
            end
        }
        use { "editorconfig/editorconfig-vim" }
        use {
            "famiu/bufdelete.nvim",
            cmd = "Bdelete",
        }
        use {
            "mizlan/iswap.nvim",
            after = "nvim-treesitter",
        }
        use {
            "olimorris/persisted.nvim",
            config = function()
                require("plugins.configs.persisted")
            end,
        }
        use {
            "Pocco81/true-zen.nvim",
            cmd = { "TZMinimalist", "TZFocus", "TZAtaraxis" },
            config = function()
                require("true-zen").setup({
                    integrations = {},
                })
            end,
        }
        use {
            "folke/todo-comments.nvim",
            requires = "nvim-lua/plenary.nvim",
            event = "BufReadPre",
            config = function()
                require("todo-comments").setup({})
            end
        }
        use {
            "nvim-neotest/neotest",
            requires = {
                "nvim-lua/plenary.nvim",
                "nvim-treesitter/nvim-treesitter",
                "antoinemadec/FixCursorHold.nvim",
                "nvim-neotest/neotest-python",
                "nvim-neotest/neotest-go",
                "nvim-neotest/neotest-plenary",
            },
            ft = { "python", "go" },
            cmd = {
                "NeotestSummaryToggle",
                "NeotestRunSuite",
                "NeotestRunNearest",
                "NeotestRunLast",
                "NeotestDebugNearest",
                "NeotestDebugLast",
            },
            config = function()
                require("plugins.configs.neotest")
            end
        }

        -- debugging
        use {
            "mfussenegger/nvim-dap",
            requires = {
                "mfussenegger/nvim-dap-python",
                "leoluz/nvim-dap-go",
            },
            module = { "dap" },
            config = function()
                require("plugins.configs.dap")
            end
        }

        -- terminal
        use {
            "akinsho/toggleterm.nvim",
            -- disable = true,
            cmd = { "ToggleTerm" },
            config = function()
                require("toggleterm").setup({
                    shade_terminals = true,
                    size = 13,
                    direction = "horizontal",
                    float_opts = {
                        border = "double",
                        windblend = 12,
                    },
                })
            end
        }
        use {
            "aserowy/tmux.nvim",
            config = function()
                require("tmux").setup({
                    copy_sync = {
                        enable = false,
                    },
                    navigation = {
                        enable_default_keybindings = true,
                    },
                    resize = {
                        enable_default_keybindings = true,
                        resize_step_x = 3,
                        resize_step_y = 3,
                    },
                })
            end
        }

        -- user interfaces
        use {
            "lukas-reineke/indent-blankline.nvim",
            event = { "BufRead" },
            config = function()
                require("plugins.configs.indentblankline")
            end
        }
        use {
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true },
            config = function()
                require("plugins.configs.lualine")
            end
        }
        use { "kevinhwang91/nvim-bqf", ft = "qf" }
        use {
            "sindrets/diffview.nvim",
            requires = "nvim-lua/plenary.nvim",
            cmd = { "DiffviewOpen", "DiffviewFileHistory" },
            config = function()
                require("diffview").setup()
            end
        }
        use { "anuvyklack/pretty-fold.nvim",
            requires = {
                "anuvyklack/nvim-keymap-amend",
                "anuvyklack/fold-preview.nvim"
            },
            event = { "BufRead" },
            config = function()
                require("pretty-fold").setup({})
                require("fold-preview").setup({})
            end
        }
        use {
            "toppair/reach.nvim",
            module = { "reach" },
            config = function()
                require("reach").setup()
            end
        }
        use { "nathom/filetype.nvim" }
        use {
            "stevearc/dressing.nvim",
            config = function()
                require("plugins.configs.dressing")
            end,
        }
        use {
            "rcarriga/nvim-notify",
            config = function()
                local notify = require("notify")
                notify.setup({
                    timeout = 1000
                })
                vim.notify = notify
            end
        }

        -- language specific
        use {
            "hynek/vim-python-pep8-indent",
            ft = "python",
        }
        use {
            "ellisonleao/glow.nvim",
            setup = function()
                vim.g.glow_width = 90
            end,
            cmd = { "Glow" }
        }
        use {
            "wren/jrnl.vim",
            ft = "jrnl",
        }

        -- colorschemes
        use { "rebelot/kanagawa.nvim" }
    end,

    config = config
})
