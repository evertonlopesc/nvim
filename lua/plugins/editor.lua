M = {
  {
    'RRethy/vim-illuminate',
    event = 'BufReadPost',
  },

  {
    'windwp/nvim-autopairs',
    event = 'BufReadPost',
    opts = {
      disable_filetype = {
        'TelescopePrompt',
        'vim',
      },
      enable_check_bracket_line = false,
    },
    config = true,
  },

  {
    'mattn/emmet-vim',
    keys = {
      { '<leader>y', ':Emmet ', desc = 'Emmet' },
    },
    cmd = 'Emmet',
  },

  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'BufReadPost',
    config = true,
  },

  {
    'numToStr/Comment.nvim',
    event = 'BufReadPost',
    opts = {
      ignore = '^$',
      pre_hook = function()
        require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
      end,
    },
    config = true,
  },

  {
    'echasnovski/mini.indentscope',
    event = 'BufReadPost',
    version = false,
    opts = {
      symbol = '│',
      options = { try_as_border = true },
    },
    config = function(_, opts)
      vim.api.nvim_create_autocmd('FileType', {
        pattern = {
          'help',
          'alpha',
          'dashboard',
          'neo-tree',
          'Trouble',
          'lazy',
          'mason',
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
      require('mini.indentscope').setup(opts)
    end,
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufReadPost',
    dependencies = { 'nvim-treesitter' },
    opts = {
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
    },
    config = true,
    init = function()
      vim.opt.list = true
      vim.opt.listchars:append('eol:↴')
    end,
  },
}

return M
