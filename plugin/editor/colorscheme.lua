local nf = require "nightfox"
local one = require "onedarkpro"
local catp = require "catppuccin"
local mki = require "monokai"
local drac = require("dracula")

nf.setup {
  transparent = true,
}

one.setup {
  theme = "onedark",
  plugins = {
    treesitter = false,
  },
  styles = {
    comments = "italic",
    functions = "bold",
  },
}

catp.setup {
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

mki.setup {
  palette = require "monokai".pro,
}

drac.setup {}

vim.cmd "colorscheme nightfox"
