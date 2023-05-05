M = {
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    event = 'BufReadPost',
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = true,
    dependencies = {
      { 'p00f/nvim-ts-rainbow' },
    },
    opts = {
      ensure_installed = {
        'typescript',
        'markdown',
        'lua',
        'rust',
        'ruby',
        'javascript',
        'vim',
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_line = nil,
      },
    },
    init = function()
      vim.api.nvim_create_autocmd(
        { 'BufEnter', 'BufAdd', 'BufNew', 'BufNewFile', 'BufWinEnter' },
        {
          group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
          callback = function()
            vim.opt.foldmethod = 'expr'
            vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
          end,
        }
      )
    end,
    config = true,
  },
}

return M
