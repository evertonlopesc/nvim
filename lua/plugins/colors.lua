local M = {
  {
    'norcalli/nvim-colorizer.lua',
    event = 'BufReadPost',
    config = function()
      require('colorizer').setup()
    end,
  },

  {
    'rose-pine/neovim',
    name = 'rose-pine',
    enable = false,
    opts = {
      dark_variant = 'moon',
      bold_vert_split = false,
      dim_nc_background = false,
      disable_background = false,
      disable_float_background = false,
      disable_italics = false,
      groups = {
        background = 'base',
        panel = 'surface',
        border = 'highlight_med',
        comment = 'muted',
        link = 'iris',
        punctuation = 'subtle',
        error = 'love',
        hint = 'iris',
        info = 'foam',
        warn = 'gold',
        headings = {
          h1 = 'iris',
          h2 = 'foam',
          h3 = 'rose',
          h4 = 'gold',
          h5 = 'pine',
          h6 = 'foam',
        },
      },
      highlight_groups = {
        ColorColumn = { bg = 'rose' },
      },
    },
    config = true,
  },

  {
    'projekt0n/github-nvim-theme',
    lazy = false,
    priority = 1000,
    version = 'v0.0.7',
  },
}

return M
