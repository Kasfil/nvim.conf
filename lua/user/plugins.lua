local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "single" })
    end,
  },
})

return packer.startup(function(use)
  -- ensure packer is not removed
  use({ "wbthomason/packer.nvim" })
  use({
    "miversen33/import.nvim",
    config = function()
      require("import").config({
        output_split_type = "vertical",
        import_failed_icon = " ",
        import_success_icon = " ",
      })
    end,
  })
  use({ "nvim-lua/plenary.nvim" })
  -- syntax highlighting
  use({ "nvim-treesitter/nvim-treesitter" })

  -- git integration
  use({ "lewis6991/gitsigns.nvim" })
  use({
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
        },
      })
    end,
  })
  use({
    "akinsho/git-conflict.nvim",
    config = function()
      require("git-conflict").setup()
    end,
  })

  -- lsp stuff
  use({ "hrsh7th/nvim-cmp" })
  use({ "windwp/nvim-autopairs" })
  use({
    "L3MON4D3/LuaSnip",
    requires = { "rafamadriz/friendly-snippets" },
  })
  use({ "saadparwaiz1/cmp_luasnip", after = "LuaSnip" })
  use({ "hrsh7th/cmp-nvim-lua" })
  use({ "hrsh7th/cmp-nvim-lsp" })
  use({ "hrsh7th/cmp-buffer" })
  use({ "hrsh7th/cmp-path" })
  use({ "ray-x/lsp_signature.nvim" })
  use({ "neovim/nvim-lspconfig" })
  use({ "jose-elias-alvarez/null-ls.nvim" })
  use({
    "folke/lsp-trouble.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
  })
  use({ "rmagatti/goto-preview" })
  use({
    "j-hui/fidget.nvim",
    after = "nvim-lspconfig",
    config = function()
      require("fidget").setup({
        text = {
          spinner = "dots_snake",
          done = "✓",
        },
      })
    end,
  })

  -- utilities
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  })
  use({ "lukas-reineke/virt-column.nvim" })
  use({
    "danymat/neogen",
    config = function()
      require("neogen").setup({
        enabled = true,
      })
    end,
  })
  use({ "ggandor/leap.nvim" })
  use({
    "kyazdani42/nvim-tree.lua",
    requires = { "kyazdani42/nvim-web-devicons" },
  })
  use({ "kylechui/nvim-surround" })
  use({
    "ethanholz/nvim-lastplace",
    event = { "BufRead" },
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
        lastplace_open_folds = true,
      })
    end,
  })
  use({ "nvim-telescope/telescope.nvim" })
  use({ "simrat39/symbols-outline.nvim" })
  use({ "editorconfig/editorconfig-vim" })
  use({ "famiu/bufdelete.nvim" })
  use({
    "mizlan/iswap.nvim",
    after = "nvim-treesitter",
  })
  use({
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup({
        preview_empty_name = true,
        input_buffer_type = "dressing",
      })
    end,
  })
  use({
    "olimorris/persisted.nvim",
    config = function()
      require("user.configs.persisted")
    end,
  })
  use({ "Pocco81/true-zen.nvim" })
  use({
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    event = "BufReadPre",
    config = function()
      require("todo-comments").setup({})
    end,
  })
  use({
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-go",
      "nvim-neotest/neotest-plenary",
    },
    config = function()
      require("user.configs.neotest")
    end,
  })
  use({ "klen/nvim-config-local" })
  use({ "toppair/reach.nvim" })
  use({ "NvChad/nvim-colorizer.lua" })
  use({ "nvim-neorg/neorg" })

  -- debugging
  use({
    "mfussenegger/nvim-dap",
    requires = {
      "mfussenegger/nvim-dap-python",
      "leoluz/nvim-dap-go",
    },
  })

  -- terminal
  use({ "akinsho/toggleterm.nvim" })
  use({
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
    end,
  })

  -- user interfaces
  use({ "lukas-reineke/indent-blankline.nvim" })
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })
  use({ "kevinhwang91/nvim-bqf", ft = "qf" })
  use({
    "sindrets/diffview.nvim",
    requires = "nvim-lua/plenary.nvim",
  })
  use({
    "anuvyklack/pretty-fold.nvim",
    requires = {
      "anuvyklack/nvim-keymap-amend",
      "anuvyklack/fold-preview.nvim",
    },
  })
  use({ "SmiteshP/nvim-navic" })
  use({ "nathom/filetype.nvim" })
  use({ "stevearc/dressing.nvim" })
  use({ "rcarriga/nvim-notify" })

  -- language specific
  use({ "hynek/vim-python-pep8-indent" })
  use({ "ray-x/go.nvim" })
  use({
    "ellisonleao/glow.nvim",
    setup = function()
      vim.g.glow_width = 90
    end,
  })
  use({
    "wren/jrnl.vim",
    ft = "jrnl",
  })

  -- colorschemes
  use({ "rebelot/kanagawa.nvim" })
  use({
    "catppuccin/nvim",
    as = "catppuccin",
    tag = "v0.2.2",
  })
end)
