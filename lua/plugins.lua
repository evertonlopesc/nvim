-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Startup
  use {
      'goolord/alpha-nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.opts)
      end
  }

  -- Searching Files/Tags
  use { 'ibhagwan/fzf-lua',
    requires = {
      'vijaymarupudi/nvim-fzf',
      'kyazdani42/nvim-web-devicons'
    }
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
  }

  -- Syntax highlight
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('config.treesitter')
    end
  }

  -- Colorize
  use {
    'norcalli/nvim-colorizer.lua',
    config = function ()
      require'colorizer'.setup()
    end
  }

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    requires = {{"williamboman/nvim-lsp-installer"}},
    config = function()
      require("config.lsp")
    end,
  }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  }

  -- Completion
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      "hrsh7th/cmp-buffer",
    },
    config = function()
      require("config.cmp")
    end,
  }
  use "onsails/lspkind-nvim"

  -- GIT
  use {
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require("config.neogit")
    end
  }

  -- Colorscheme / Themes
  use 'folke/tokyonight.nvim'
  use 'ishan9299/nvim-solarized-lua'
  use 'drewtempelmeyer/palenight.vim'
  use 'gosukiwi/vim-atom-dark'
  use 'sainnhe/gruvbox-material'
  use 'ayu-theme/ayu-vim'
  use 'rafamadriz/neon'
  use 'andersevenrud/nordic.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use {
      "mcchrish/zenbones.nvim",
      requires = "rktjmp/lush.nvim"
  }
  use 'rmehri01/onenord.nvim'

  -- Statusbar
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config= function()
      require("config.lualine")
    end
  }

  -- Buffer
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function ()
      require("bufferline").setup{}
    end
  }

  -- Folders
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require("config.nvim_tree") end
  }

  -- Ident
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('config.ident')
    end
  }

  -- Terminal
  use {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup{
        direction = 'float',
      }
    end
  }

  -- Developments
  use 'jiangmiao/auto-pairs'
  use 'vim-ruby/vim-ruby'
  use {
    'mattn/emmet-vim',
    config = function ()
      require('config.emmet')
    end
  }

  -- Commentary
  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }
  -- Which-key
  use {
      'AckslD/nvim-whichkey-setup.lua',
      requires = {'liuchengxu/vim-which-key'},
      config = function ()
        require('config.key')
      end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
