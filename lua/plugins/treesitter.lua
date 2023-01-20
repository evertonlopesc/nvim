local M = {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      { 'p00f/nvim-ts-rainbow' },
    },
    config = function()
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

      require('nvim-treesitter.configs').setup({
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
      })
    end,
  },
}

return M
