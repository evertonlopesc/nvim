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

  -- {
  --   'kevinhwang91/nvim-ufo',
  --   dependencies = { 'kevinhwang91/promise-async' },
  --   event = "BufReadPost",
  --   config = true,
  -- }
}

return M
