local M = {
  {
    'norcalli/nvim-colorizer.lua',
    event = 'BufReadPost',
    config = function()
      require('colorizer').setup()
    end,
  },

  {
    'projekt0n/github-nvim-theme',
    priority = 1000,
    version = 'v0.0.7',
  },
}

return M
