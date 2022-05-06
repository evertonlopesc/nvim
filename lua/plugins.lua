local cmd = vim.cmd
local fn = vim.fn
local startup = require 'packer'.startup
local use = require 'packer'.use

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
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
      'williamboman/nvim-lsp-installer',
      { 'folke/trouble.nvim', 'kyazdani42/nvim-web-devicons' },
      'onsails/lspkind-nvim',
      'ray-x/lsp_signature.nvim'
    },
    config = function() require('config.lsp') end
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
    },
    config = function() require 'config.completion' end
  }

  -- Syntax
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require('config.syntax') end,
    require = { { 'p00f/nvim-ts-rainbow' } }
  }

  -- Terminal integration
  use {
    'akinsho/toggleterm.nvim',
    config = function() require('toggleterm').setup{ direction = 'float' } end
  }

  -- Fuzzy Finder
  use { 'ibhagwan/fzf-lua',
    requires = {
      'vijaymarupudi/nvim-fzf',
      'kyazdani42/nvim-web-devicons'
    }
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function () require('config.fuzzy_finder') end
  }

  -- Color
  use {
    'norcalli/nvim-colorizer.lua',
    config = function () require'colorizer'.setup() end
  }

  -- Colorscheme
  use {
    "EdenEast/nightfox.nvim", tag = "v1.0.0",
    config = function () require('config.colorscheme') end
  }

  -- Utility
  use {
    'rcarriga/nvim-notify',
    config = function () require 'config.utility' end
  }

  -- Tabline
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function () require('config.tabline') end
  }

  -- Statusline
  use {
    'tamton-aquib/staline.nvim',
    requires = {'kyazdani42/nvim-web-devicons',},
    config = function () require('config.statusline') end
  }

  -- Startup
  use {
    'glepnir/dashboard-nvim',
    config = function () require('config.startup') end
  }

  -- Indent
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function() require('config.indent') end
  }

  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require('config.file_explorer') end
  }

  -- Git
  use 'kdheepak/lazygit.nvim'

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function() require('config.git') end
  }

  -- Comment
  use {
    'b3nj5m1n/kommentary',
    config = function () require ('kommentary.config').use_extended_mappings() end
  }

  -- Motion
  use {
    'phaazon/hop.nvim',
    branch = 'v1', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
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
    config = function () require'octo'.setup() end
  }

  -- Editing support
  use 'jiangmiao/auto-pairs'

  -- Formatting
  use {
    'mhartington/formatter.nvim',
    config = function () require('config.formatting') end
  }

  use 'mattn/emmet-vim'

  -- Keybinding
  use {
    'AckslD/nvim-whichkey-setup.lua',
    requires = {'liuchengxu/vim-which-key'},
    config = function () require('config.keybinding') end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

return startup
