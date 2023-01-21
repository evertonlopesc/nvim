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
      { '<leader>,', ':Glow<CR>', desc = 'Glow' },
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
      { '<leader>nf', ":Neotest run.run(vim.fn.expand('%'))<CR>", desc = 'Run test file' },
      { '<leader>nu', ':Neotest run.run()<CR>', desc = 'Run test cursor' },
      { '<leader>na', ':Neotest run.run(vim.fn.getcwd())<CR>', desc = 'Test' },
      { '<leader>ns', ':Neotest summary.open()<CR>', desc = 'Test summary' },
    },
    cmd = 'Neotest',
  },
}

return M
