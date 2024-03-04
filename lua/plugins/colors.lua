M = {
  {
    'norcalli/nvim-colorizer.lua',
    event = 'BufReadPost',
    config = function()
      require('colorizer').setup()
    end,
  },

  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      local everforest = require("everforest")
      everforest.setup({
        background = "soft",
        transparentbackground_level = 0,
        italics = true,
        disable_italic_comments = false,
        on_highlights = function(hl, _)
          hl["@symbol"] = { link = "@field" }
        end,
      })
      everforest.load()
    end,
  },

  {
    'projekt0n/github-nvim-theme',
    disable = true,
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
    disable = true,
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
}

return M
