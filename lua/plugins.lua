local cmd = vim.cmd
local startup = require("packer").startup
local use = require("packer").use

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end

cmd("packadd packer.nvim")
cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

startup(function()
  -- Plugin Manager
  use("wbthomason/packer.nvim")

  -- LSP
  use({
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "folke/neodev.nvim",
    "folke/trouble.nvim",
  })

  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  })

  use("RRethy/vim-illuminate")

  -- Completion & Snippet
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "onsails/lspkind-nvim",
    },
  })

  -- Syntax
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    require = { { "p00f/nvim-ts-rainbow" } },
  })

  -- Terminal integration
  use({ "akinsho/toggleterm.nvim", tag = "v2.*" })

  -- Fuzzy Finder
  use({
    "ibhagwan/fzf-lua",
    requires = {
      "vijaymarupudi/nvim-fzf",
      "kyazdani42/nvim-web-devicons",
    },
  })

  use({
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    requires = { "nvim-lua/plenary.nvim" },
  })

  use { "nvim-telescope/telescope-file-browser.nvim" }

  -- Color
  use({
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  })

  -- Colorscheme
  use({ "EdenEast/nightfox.nvim", tag = "v1.0.0", })
  use({ "catppuccin/nvim", as = "catppuccin", })

  -- Utility
  use("rcarriga/nvim-notify")

  -- Statusline
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })

  -- Startup
  use("glepnir/dashboard-nvim")

  -- Indent
  use("lukas-reineke/indent-blankline.nvim")

  -- File explorer
  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
  })

  -- Git
  use({
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  })

  use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })
  use({
    "sindrets/diffview.nvim",
    requires = { "nvim-lua/plenary.nvim", "kyazdani42/nvim-web-devicons" },
  })

  -- Comment
  use({
    "b3nj5m1n/kommentary",
    config = function()
      require("kommentary.config").use_extended_mappings()
    end,
  })

  -- Motion
  use({
    "phaazon/hop.nvim",
    branch = "v1", -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
    end,
  })

  -- GitHub
  use({
    "pwntester/octo.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("octo").setup()
    end,
  })

  -- Tests
  use({
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "olimorris/neotest-rspec",
    },
  })

  use("mfussenegger/nvim-dap")
  use("suketa/nvim-dap-ruby")

  -- Editing support
  use("jiangmiao/auto-pairs")

  use("mattn/emmet-vim")

  use({
    "vinibispo/ruby.nvim",
    ft = { "ruby" }, -- optional
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  })

  use({
    "ellisonleao/glow.nvim",
    config = function()
      require("glow").setup({
        style = "dark",
        width = 120,
      })
    end,
  })

  use({
    "Massolari/forem.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("forem-nvim").setup({
        api_key = "5tJYZZL3bcrKsHYmYgSfabUc", -- Your API Key
      })
    end,
  })

  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  })

  if packer_bootstrap then
    require("packer").sync()
  end
end)

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>ps", ":PackerSync<CR>", opts)
vim.keymap.set("n", "<leader>pi", ":PackerInstall<CR>", opts)
vim.keymap.set("n", "<leader>pu", ":PackerUpdate<CR>", opts)
vim.keymap.set("n", "<leader>pc", ":PackerClean<CR>", opts)

return startup
