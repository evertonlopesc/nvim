M = {
  {
    'norcalli/nvim-colorizer.lua',
    event = 'BufReadPost',
    config = function()
      require('colorizer').setup()
    end,
  },

  {
    'projekt0n/github-nvim-theme',
    priority = 1001,
    version = 'v0.0.7',
    opts = {
      comment_style = 'italic',
      keyword_style = 'bold',
      function_style = 'bold',
      variable_style = 'NONE',
    },
    config = function(opts) end,
  },

  {
    'EdenEast/nightfox.nvim',
    priority = 1000,
    opts = {
      options = {
        styles = {
          comments = 'italic',
          functions = 'bold',
        },
      },
    },
    config = true,
  },

  {
    'Mofiqul/dracula.nvim',
    priority = 1002,
    opts = {
      italic_comment = true,
    },
    config = true,
  },
}

return M
