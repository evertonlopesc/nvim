require('bufferline').setup {
  options = {
    numbers = "ordinal", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    separator_style = "thick", -- 'slant', 'padded_slant', 'thick', 'thin', { 'any', 'any' }
    always_show_bufferline = true,
    sort_by = 'id', function(buffer_a, buffer_b)
      return buffer_a.modified > buffer_b.modified
    end,
    groups = {
      options = {
        toggle_hidden_on_enter = true -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
      },
      items = {
        {
          name = "back", -- mandatory
          highlight = {gui = "underline", guisp = "gray"}, -- optional
          priority = 2, -- determines where it will appear relative to other groups (optional)
          -- icon = "", -- optional
          matcher = function(buf) -- mandatory
            return buf.name:match('%.rb') or buf.name:match('%.lua')
          end,
        },
        {
          name = "tests", -- mandatory
          highlight = {gui = "underline", guisp = "gray"}, -- optional
          priority = 1, -- determines where it will appear relative to other groups (optional)
          -- icon = "", -- optional
          matcher = function(buf) -- mandatory
            return buf.name:match('%_test') or buf.name:match('%_spec') or buf.name:match('%_spec.rb')
          end,
        },
        {
          name = "front", -- mandatory
          highlight = {gui = "underline", guisp = "gray"}, -- optional
          priority = 3, -- determines where it will appear relative to other groups (optional)
          -- icon = "", -- optional
          matcher = function(buf) -- mandatory
            return buf.name:match('%.html') or buf.name:match('%.js') or buf.name:match('%.css') or buf.name:match('%.vue') or buf.name:match('%.erb')
          end,
        },
        {
          name = "docs",
          highlight = {gui = "undercurl", guisp = "green"},
          priority = 5, -- determines where it will appear relative to other groups (optional)
          auto_close = false,  -- whether or not close this group if it doesn't contain the current buffer
          matcher = function(buf)
            return buf.name:match('%.md') or buf.name:match('%.txt')
          end,
          separator = { -- optional
            style = require('bufferline.groups').separator.tab
          },
        }
      }
    }
  }
}
