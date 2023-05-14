M = {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = true,
    dependencies = {  'p00f/nvim-ts-rainbow' },
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
    config = true,
  },

  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    event = 'BufReadPost',
  },
}

return M
