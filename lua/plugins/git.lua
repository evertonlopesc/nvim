local M = {
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPost',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      current_line_blame = false,
    },
    config = true,
    keys = {
      { ']c', ':Gitsigns next_hunk<cr>' },
      { '[c', ':Gitsigns prev_hunk<cr>' },
      { '<leader>gd', ':Gitsigns diffthis<cr>' },
      { '<leader>gs', ':Gitsigns stage_hunk<cr>' },
      { '<leader>gr', ':Gitsigns reset_hunk<cr>' },
      { '<leader>gp', ':Gitsigns preview_hunk<cr>' },
      { '<leader>gb', ':Gitsigns blame_line<cr>' },
    },
    cmd = 'Gitsigns',
  },

  {
    'TimUntersberger/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<leader>g', ':Neogit<CR>', desc = 'Git' },
      { '<leader>gc', ':Neogit commit<CR>', desc = 'Commit' },
    },
    config = true,
    cmd = 'Neogit',
  },

  {
    'pwntester/octo.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = true,
    keys = {
      { '<leader>o', ':Octo actions<CR>', desc = 'Github CLI' },
    },
    cmd = 'Octo',
  },
}

return M
