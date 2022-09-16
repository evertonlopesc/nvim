local cmd = vim.cmd
local startup = require 'packer'.startup
local use = require 'packer'.use

local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim', install_path
  })
end

cmd('packadd packer.nvim')
cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

startup(function()
  -- Plugin Manager
  use 'wbthomason/packer.nvim'

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    requires = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      { 'folke/trouble.nvim', 'kyazdani42/nvim-web-devicons' },
      'onsails/lspkind-nvim',
      'ray-x/lsp_signature.nvim',
      'RRethy/vim-illuminate'
    }
  }

  use {
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  }

  -- Completion & Snippet
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline'
    }
  }

  -- Syntax
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    require = { { 'p00f/nvim-ts-rainbow' } }
  }

  -- Terminal integration
  use {
    'akinsho/toggleterm.nvim',
    tag = 'v2.*',
  }

  -- Fuzzy Finder
  use { 'ibhagwan/fzf-lua',
    requires = {
      'vijaymarupudi/nvim-fzf',
      'kyazdani42/nvim-web-devicons'
    }
  }

  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- Color
  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require 'colorizer'.setup() end
  }

  -- Colorscheme
  use {
    'EdenEast/nightfox.nvim', tag = 'v1.0.0',
    config = function()
      require('nightfox').setup {
        transparent = false
      }
      require('nightfox').load('dayfox')
    end
  }

  -- Utility
  use 'rcarriga/nvim-notify'

  -- Tabline
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    tag = 'v2.*'
  }

  -- Statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Startup
  use 'glepnir/dashboard-nvim'

  -- Indent
  use 'lukas-reineke/indent-blankline.nvim'

  -- File explorer
  --[[ use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('nvim-tree').setup {
        view = {
          number = true,
          relativenumber = true },
        update_focused_file = { enable = true }
      }
    end
  } ]]
  -- Unless you are still migrating, remove the deprecated commands from v1.x
  vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    }
  }

  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function() require('gitsigns').setup() end
  }

  -- Comment
  use {
    'b3nj5m1n/kommentary',
    config = function() require('kommentary.config').use_extended_mappings() end
  }

  -- Motion
  use {
    'phaazon/hop.nvim',
    branch = 'v1', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }

  -- GitHub
  use {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = function() require 'octo'.setup() end
  }

  -- Tests
  use {
    'nvim-neotest/neotest',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'antoinemadec/FixCursorHold.nvim',
      'olimorris/neotest-rspec'
    },
  }

  use 'mfussenegger/nvim-dap'
  use 'suketa/nvim-dap-ruby'


  -- Editing support
  use 'jiangmiao/auto-pairs'

  use 'mattn/emmet-vim'

  use {
    'vinibispo/ruby.nvim',
    ft = { 'ruby' }, -- optional
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter'
    }
  }

  use {
    'ellisonleao/glow.nvim',
    config = function()
      require('glow').setup({
        style = 'light',
        width = 120,
      })
    end
  }

  use {
    'Massolari/forem.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim'
    },
    config = function()
      require 'forem-nvim'.setup {
        api_key = '5tJYZZL3bcrKsHYmYgSfabUc' -- Your API Key
      }
    end
  }

  use {
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

return startup
