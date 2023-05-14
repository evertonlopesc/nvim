M = {
  {
    'ellisonleao/glow.nvim',
    opts = {
      width = 120,
    },
    config = true,
    cmd = 'Glow',
    ft = 'markdown',
  },

  {
    'iamcco/markdown-preview.nvim',
    event = 'BufReadPost',
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    ft = { 'markdown' },
    cmd = 'MarkdownPreview',
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
      {
        '<leader>nf',
        ":Neotest run.run(vim.fn.expand('%'))<CR>",
        desc = 'Run test file',
      },
      { '<leader>nu', ':Neotest run.run()<CR>',                desc = 'Run test cursor' },
      { '<leader>ns', ':Neotest summary.open()<CR>',           desc = 'Test summary' },
    },
    cmd = 'Neotest',
  },

  {
    'folke/which-key.nvim',
    config = true
  },
}

return M
