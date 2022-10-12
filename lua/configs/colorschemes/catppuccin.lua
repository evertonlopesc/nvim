local catp = require "catppuccin"
catp.setup {
  transparent_background = true,
  styles = {
    comments = {},
    conditionals = {},
    functions = {},
  },
  integrations = {
    neogit = true,
    hop = true,
    dashboard = true,
  },
}

vim.g.catppuccin_flavour = "frappe"
