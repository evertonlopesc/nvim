local actions = require "telescope.actions"

require("telescope").setup {
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim",
    },
  },
  pickers = {
    find_files = {
      find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
    },
  },
}

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>ft", ":Telescope <CR>", opts)
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<cr>", opts)
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
vim.keymap.set("n", "<leader>fo", ":Telescope oldfiles<cr>", opts)
vim.keymap.set( "n", "<leader>fl", ":Telescope lsp_document_symbols<cr>", opts)
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<cr>", opts)
vim.keymap.set("n", "<leader>fk", ":Telescope keymaps<cr>", opts)

vim.keymap.set("n", "<leader>fm", ":Fzf files<cr>", opts)
