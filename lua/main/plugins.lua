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
            return require("packer.util").float({border = "single"})
        end
    },
    profile = {
        enable = true,
        threshold = 1,
    },
    compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua"
}

return require("packer").startup({
    function(use)
        -- ensure packer is not removed
        use {"wbthomason/packer.nvim"}

        -- impatient
        use {
            "lewis6991/impatient.nvim",
            config = function()
                require("impatient").enable_profile()
            end
        }

        -- git integration
        use {"tpope/vim-fugitive", cmd = {"Git"}}
        use {
            "lewis6991/gitsigns.nvim",
            event = {"BufRead"},
            requires = {"nvim-lua/plenary.nvim"},
            config = function()
                require("packs.gitsigns")
            end
        }

        -- LSP and completion
        use {"neovim/nvim-lspconfig"}
        use {"ray-x/lsp_signature.nvim"}
        use {"L3MON4D3/LuaSnip"}
        use {"windwp/nvim-autopairs"}
        use {
            "hrsh7th/nvim-cmp",
            requires = {
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-nvim-lua",
                "saadparwaiz1/cmp_luasnip",
                "lukas-reineke/cmp-under-comparator",
            }
        }
        use {
            "folke/trouble.nvim",
            requires = {"kyazdani42/nvim-web-devicons"},
            keys = {"<A-d>"},
            cmd = {"TroubleToggle"},
            config = function()
                require("packs.trouble")
            end
        }
        use {
            "rmagatti/goto-preview",
            keys = {"gpd", "gpi"},
            config = function()
                require("packs.goto_prev")
            end
        }

        -- debugging utility
        use {
            "mfussenegger/nvim-dap",
            keys = {"<leader>db", "<leader>dc", "<leader>dwb"},
            requires = {
                "mfussenegger/nvim-dap-python"
            },
            config = function()
                require("packs.dap")
            end
        }
        use {
            "numToStr/Comment.nvim",
            event = {"BufRead"},
            config = function()
                require("Comment").setup()
            end
        }
        use {
            "mg979/vim-visual-multi",
            keys = {{"n", "<C-n>"}},
            branch = "master"
        }

        -- syntax highlighting
        use {
            "nvim-treesitter/nvim-treesitter",
            event = {"BufRead"},
            config = function()
                require("packs.treesitter")
            end
        }
        use {
            "nvim-telescope/telescope.nvim",
            requires = {"nvim-lua/plenary.nvim"},
            cmd = {"Telescope"},
            keys = {"<leader>ff", "<leader>fb", "<leader>fg", "<leader>fh"},
            config = function()
                require("packs.telescope")
            end
        }
        use {
            "kyazdani42/nvim-tree.lua",
            cmd = {"NvimTreeToggle", "NvimTreeFocus"},
            requires = {"kyazdani42/nvim-web-devicons"},
            config = function()
                require("packs.nvimtree")
            end
        }
        use {
            "ggandor/lightspeed.nvim",
            keys = {"s", "S", "f", "F"},
            config = function()
                require("packs.lightspeed")
            end
        }
        use {
            "jghauser/mkdir.nvim",
            config = function()
                require("mkdir")
            end
        }
        use {
            "mhartington/formatter.nvim",
            cmd = {"Format", "FormatWrite"},
            event = {"BufWritePre"},
            config = function()
                require("packs.formatter")
            end
        }
        use {
            "blackCauldron7/surround.nvim",
            event = {"BufRead"},
            config = function()
                require"surround".setup {mappings_style = "surround"}
            end
        }
        use {
            "ethanholz/nvim-lastplace",
            event = {"BufRead"},
            config = function()
                require("nvim-lastplace").setup({
                    lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
                    lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
                    lastplace_open_folds = true
                })
            end
        }

        -- user interfaces
        use {
            "akinsho/toggleterm.nvim",
            cmd = {"ToggleTerm"},
            module = {"toggleterm"},
            keys = {"<leader>tt", "<leader>tg"},
            config = function()
                require("packs.toggleterm")
            end
        }
        use {
            "akinsho/bufferline.nvim",
            event = {"VimEnter"},
            config = function()
                require("packs.bufferline")
            end
        }
        use {
            "lukas-reineke/indent-blankline.nvim",
            event = {"BufRead"},
            config = function()
                require("packs.indentblankline")
            end
        }
        use {
            "nvim-lualine/lualine.nvim",
            event = {"VimEnter"},
            requires = {"kyazdani42/nvim-web-devicons"},
            config = function()
                require("packs.lualine")
            end
        }
        use {
            "simrat39/symbols-outline.nvim",
            cmd = {"SymbolsOutline"},
            keys = {"<space>o"},
            config = function()
                require("packs.outline")
            end
        }
        use {"folke/which-key.nvim"}
        use {"onsails/lspkind-nvim"}

        -- utility
        use {"famiu/bufdelete.nvim"}
        use {"editorconfig/editorconfig-vim"}

        -- language specific
        use {
            "Vimjas/vim-python-pep8-indent",
            ft = "python"
        }

        -- colorschemes
        use { "projekt0n/github-nvim-theme" }
    end,
    config = config
})
