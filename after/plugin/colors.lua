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

function ColorEve()
  color = color or "rose-pine"

  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorEve()
