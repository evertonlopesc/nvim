local M = {
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
  },

  {
    'RRethy/vim-illuminate',
  },

  {
    'numToStr/Comment.nvim',
  },

  {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function()
      require('hop').setup({ keys = 'etovxqpdygfblzhckisuran' })
    end,
  },

  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    config = function()
      require('rose-pine').setup({
        dark_variant = 'main', --- @usage 'main' | 'moon'
        bold_vert_split = false,
        dim_nc_background = false,
        disable_background = false,
        disable_float_background = false,
        disable_italics = true,

        groups = {
          background = 'base',
          panel = 'surface',
          border = 'highlight_med',
          comment = 'muted',
          link = 'iris',
          punctuation = 'subtle',

          error = 'love',
          hint = 'iris',
          info = 'foam',
          warn = 'gold',

          headings = {
            h1 = 'iris',
            h2 = 'foam',
            h3 = 'rose',
            h4 = 'gold',
            h5 = 'pine',
            h6 = 'foam',
          },
        },

        highlight_groups = {
          ColorColumn = { bg = 'rose' },
        },
      })

      vim.opt.background = 'light'
      vim.cmd.colorscheme('rose-pine')
    end,
  },

  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup({
        pre_hook = require(
          'ts_context_commentstring.integrations.comment_nvim'
        ).create_pre_hook(),
      })
    end,
  },

  {
    'JoosepAlviste/nvim-ts-context-commentstring',
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    dependencies = 'nvim-treesitter',
    config = function()
      vim.opt.list = true
      vim.opt.listchars:append('eol:↴')
      require('indent_blankline').setup({
        char = '⋅',
        use_treesitter = true,
        space_char_blankline = ' ',
        show_first_indent_level = false,
        show_trailing_blankline_indent = false,
        show_current_context = true,
        use_treesitter_scope = false,
        context_patterns = {
          '^for',
          '^func',
          '^if',
          '^object',
          '^table',
          '^while',
          'argument_list',
          'arguments',
          'block',
          'catch_clause',
          'class',
          'dictionary',
          'do_block',
          'element',
          'else_clause',
          'except',
          'for',
          'function',
          'if_statement',
          'import_statement',
          'method',
          'object',
          'operation_type',
          'return',
          'table',
          'try',
          'try_statement',
          'tuple',
          'while',
          'with',
        },
      })
    end,
  },

  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },

  {
    'TimUntersberger/neogit',
    dependencies = 'nvim-lua/plenary.nvim',
  },

  {
    'pwntester/octo.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = function()
      require('octo').setup()
    end,
  },

  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'antoinemadec/FixCursorHold.nvim',
      'olimorris/neotest-rspec',
    },
  },

  {
    'mattn/emmet-vim'
  },

  {
    'ellisonleao/glow.nvim',
    ft = 'markdown',
    config = function()
      require('glow').setup({
        style = 'dark',
        width = 120,
      })
    end,
  },

  {
    'Massolari/forem.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('forem-nvim').setup({
        api_key = '5tJYZZL3bcrKsHYmYgSfabUc',
      })
    end,
  },
}

return M
