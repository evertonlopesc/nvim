require("catppuccin").setup({
  transparent_background = true,
  integrations = {
    neogit = true,
    hop = true,
    dashboard = true,
  },
})

vim.opt.background = "dark"
vim.cmd("colorscheme catppuccin")

print("Hello colors")
