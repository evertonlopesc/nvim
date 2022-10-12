local one = require "onedarkpro"
one.setup {
  theme = "onedark",
  plugins = {
    treesitter = false,
  },
  styles = {
    comments = "italic",
    functions = "bold",
  },
  options = {
    transparency = true,
  },
}
