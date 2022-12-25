require("onedarkpro").setup({
  options = {
    bold = true,
    italic = false,
    underline = false,
    undercurl = false,

    cursorline = true,
    transparency = false,
  },
  colors = {
    onelight = {
      bg = "#DEDEDE"
    }
  },
})

vim.opt.background = "dark"
require("glow").setup({
  style = "dark"
})

vim.cmd.colorscheme("rose-pine")
