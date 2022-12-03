require("nightfox").setup()

require("glow").setup({
  style = "light"
})

vim.opt.background = "light"
vim.api.nvim_command("colorscheme dayfox")
