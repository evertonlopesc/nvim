local neogit = require "neogit"

neogit.setup {}

vim.keymap.set("n", "<leader>gc", "<cmd> Neogit commit <cr>")
