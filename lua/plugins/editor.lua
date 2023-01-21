local M = {
  {
    'RRethy/vim-illuminate',
  },

  {
    'jiangmiao/auto-pairs',
    lazy = false,
  },

  {
    'mattn/emmet-vim',
    keys = {
      { '<leader>y', ':Emmet ', desc = 'Emmet' },
    },
    cmd = 'Emmet',
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    lazy = false,
    config = true,
  },

  {
    'numToStr/Comment.nvim',
    lazy = false,
    opts = {
      ignore = '^$',
      pre_hook = function()
        require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
      end,
    },
    config = true,
  },

  {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = "BufReadPre",
    opts = {
      -- symbol = "▏",
      symbol = "│",
      options = { try_as_border = true },
    },
    config = function(_, opts)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
      require("mini.indentscope").setup(opts)
    end,
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    lazy = false,
    dependencies = 'nvim-treesitter',
    opts = {
      char = '⋅',
      use_treesitter = true,
      space_char_blankline = ' ',
      show_first_indent_level = false,
      show_trailing_blankline_indent = false,
      show_current_context = false,
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
