local neogit = require "neogit"

neogit.setup {}

vim.keymap.set("n", "<leader>ic", "<cmd> Neogit commit <cr>")
vim.keymap.set("n", "<leader>ip", "<cmd> Neogit push <cr>")
vim.keymap.set("n", "<leader>iu", "<cmd> Neogit pull <cr>")
