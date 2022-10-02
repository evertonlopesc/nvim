require("bufferline").setup {
  options = {
    numbers = "ordinal",
    separator_style = "thick",
    always_show_bufferline = true,
    sort_by = "id",
    function(buffer_a, buffer_b)
      return buffer_a.modified > buffer_b.modified
    end,
    groups = {
      options = {
        toggle_hidden_on_enter = true,
      },
      items = {
        {
          name = "back",
          highlight = { gui = "underline", guisp = "gray" },
          priority = 1,
          matcher = function(buf)
            return buf.name:match "%.rb"
              or buf.name:match "%.lua"
              or buf.name:match "%.js"
              or buf.name:match "%.ts"
          end,
        },
        {
          name = "front",
          highlight = { gui = "underline", guisp = "gray" },
          priority = 2,
          matcher = function(buf)
            return buf.name:match "%.html"
              or buf.name:match "%.css"
              or buf.name:match "%.vue"
              or buf.name:match "%.erb"
          end,
        },
        {
          name = "config",
          highlight = { gui = "underline", guisp = "gray" },
          priority = 3,
          matcher = function(buf)
            return buf.name:match "%.yml"
              or buf.name:match "%.lock"
              or buf.name:match "%.dev"
              or buf.name:match "%.env"
              or buf.name:match "%.keep"
          end,
        },
        {
          name = "doc",
          highlight = { gui = "undercurl", guisp = "gray" },
          priority = 4,
          matcher = function(buf)
            return buf.name:match "%.md" or buf.name:match "%.txt"
          end,
        },
      },
    },
  },
}
