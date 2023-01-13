local cmd = vim.cmd
local startup = require('packer').startup
local use = require('packer').use

local install_path = vim.fn.stdpath('data')
  .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
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
  use('wbthomason/packer.nvim')

  -- LSP
  use('williamboman/mason.nvim')
  use('williamboman/mason-lspconfig.nvim')
  use('neovim/nvim-lspconfig')
  use('folke/neodev.nvim')
  use('folke/trouble.nvim')

  use({
    'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  })

  use('RRethy/vim-illuminate')

  -- Completion & Snippet
  use({
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
      'hrsh7th/cmp-buffer',
      'onsails/lspkind-nvim',
    },
  })

  -- Syntax
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    require = { { 'p00f/nvim-ts-rainbow' } },
  })

  -- Fuzzy Finder
  use({
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = {
      'nvim-lua/plenary.nvim',
    },
  })

  -- Color
  use({
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  })

  -- Colorscheme
  use({ 'EdenEast/nightfox.nvim', tag = 'v1.0.0', disable = true })
  use({ 'olimorris/onedarkpro.nvim', disable = true })
  use({ 'rose-pine/neovim', as = 'rose-pine' })

  -- Utility
  use('rcarriga/nvim-notify')

  -- Statusline
  use({
    'nvim-lualine/lualine.nvim',
  })

  -- Startup
  use({
    'glepnir/dashboard-nvim',
    disable = true,
  })

  -- Indent
  use({
    'lukas-reineke/indent-blankline.nvim',
    requires = 'nvim-treesitter',
  })

  -- File explorer
  use({
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
  })

  -- Git
  use({
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('gitsigns').setup({
        current_line_blame = false,
      })
    end,
  })

  use({ 'tpope/vim-fugitive', disable = true })
  use({ 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' })

  -- Comment
  use({
    'b3nj5m1n/kommentary',
    disable = true,
    config = function()
      require('kommentary.config').setup({})
    end,
  })

  use({
    'numToStr/Comment.nvim',
  })

  use('JoosepAlviste/nvim-ts-context-commentstring')

  -- Motion
  use({
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function()
      require('hop').setup({ keys = 'etovxqpdygfblzhckisuran' })
    end,
  })

  -- GitHub
  use({
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = function()
      require('octo').setup()
    end,
  })

  -- Tests
  use({
    'nvim-neotest/neotest',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'antoinemadec/FixCursorHold.nvim',
      'olimorris/neotest-rspec',
    },
  })

  use({ 'mfussenegger/nvim-dap', disable = true })
  use({ 'suketa/nvim-dap-ruby', disable = true })

  -- Editing support
  use('jiangmiao/auto-pairs')
  use('mattn/emmet-vim')

  use({
    'ellisonleao/glow.nvim',
    config = function()
      require('glow').setup({
        style = 'dark',
        width = 120,
      })
    end,
  })

  use({
    'Massolari/forem.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('forem-nvim').setup({
        api_key = '5tJYZZL3bcrKsHYmYgSfabUc',
      })
    end,
  })

  use({
    'kylechui/nvim-surround',
    tag = '*',
    config = function()
      require('nvim-surround').setup({})
    end,
  })

  use({
    'iamcco/markdown-preview.nvim',
    run = 'cd app && npm install',
    setup = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  })

  if packer_bootstrap then
    require('packer').sync()
  end
end)

return startup
