local neogit = require "neogit"

neogit.setup {
  integrations = {
    diffview = true,
  },
}

vim.keymap.set("n", "<leader>ii", "<cmd> Neogit <cr>")
vim.keymap.set("n", "<leader>id", "<cmd> Neogit diff <cr>")
vim.keymap.set("n", "<leader>ic", "<cmd> Neogit commit <cr>")
vim.keymap.set("n", "<leader>is", "<cmd> Neogit push <cr>")
vim.keymap.set("n", "<leader>il", "<cmd> Neogit pull <cr>")
