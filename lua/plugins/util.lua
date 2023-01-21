local M = {
  {
    'ellisonleao/glow.nvim',
    opts = {
      style = 'dark',
      width = 120,
    },
    config = true,
    cmd = 'Glow',
    keys = {
      { '<leader>,', ':Glow<CR>' },
    },
    ft = 'markdown',
  },

  {
    'Massolari/forem.nvim',
    opts = {
      api_key = '5tJYZZL3bcrKsHYmYgSfabUc',
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = true,
    cmd = 'Forem',
  },

  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'antoinemadec/FixCursorHold.nvim',
      'olimorris/neotest-rspec',
    },
    ft = { 'rb' },
    opts = {
      adapters = function()
        require('neotest-rspec')
      end,
    },
    config = true,
    keys = {
      { '<leader>nf', ":Neotest run.run(vim.fn.expand('%'))<CR>" },
      { '<leader>nu', ':Neotest run.run()<CR>' },
      { '<leader>na', ':Neotest run.run(vim.fn.getcwd())<CR>' },
      { '<leader>ns', ':Neotest summary.open()<CR>' },
    },
    cmd = 'Neotest',
  },
}

return M
