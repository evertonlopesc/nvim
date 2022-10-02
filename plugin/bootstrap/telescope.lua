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
vim.keymap.set("n", "<leader>ff", ":lua require('telescope.builtin').find_files()<cr>", opts)
vim.keymap.set("n", "<leader>fg", ":lua require('telescope.builtin').live_grep()<cr>", opts)
vim.keymap.set("n", "<leader>fo", ":lua require('telescope.builtin').oldfiles()<cr>", opts)
vim.keymap.set(
  "n",
  "<leader>fl",
  ":lua require('telescope.builtin').lsp_document_symbols()<cr>",
  opts
)

vim.keymap.set("n", "<leader>fm", ":lua require('fzf-lua').files()<CR>", opts)
