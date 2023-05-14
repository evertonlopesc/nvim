M = {
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
    cmd = 'Gitsigns',
    keys = {
      { ']c', ':Gitsigns next_hunk<CR>', desc = 'Next hunk' },
      { '[c', ':Gitsigns prev_hunk<CR>', desc = 'Previous hunk' },
      { '<leader>gd', ':Gitsigns diffthis<CR>', desc = 'Diff this' },
      { '<leader>gs', ':Gitsigns stage_hunk<CR>', desc = 'Stage hunk' },
      { '<leader>gr', ':Gitsigns reset_hunk<CR>', desc = 'Reset hunk' },
      { '<leader>gp', ':Gitsigns preview_hunk<CR>', desc = 'Preview hunk' },
      { '<leader>gb', ':Gitsigns blame_line<CR>', desc = 'Blame line' },
    },
  },

  {
    'TimUntersberger/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      signs = {
        section = { '', '' },
        item = { '', '' },
        hunk = { '', '' },
      },
    },
    keys = {
      { '<leader>gg', ':Neogit<CR>', desc = 'Git' },
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
