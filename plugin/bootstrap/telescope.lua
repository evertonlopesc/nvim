local actions = require "telescope.actions"
local telescope = require("telescope")

telescope.setup {
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

local builtin = require("telescope.builtin")

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>ft", ":Telescope <CR>", opts)
vim.keymap.set("n", "<leader>ff", builtin.find_files, opts)
vim.keymap.set("n", "<leader>fg", builtin.live_grep, opts)
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, opts)
vim.keymap.set( "n", "<leader>fl",builtin.lsp_document_symbols, opts)
vim.keymap.set("n", "<leader>fb", builtin.buffers, opts)
vim.keymap.set("n", "<leader>fk", builtin.keymaps, opts)

vim.keymap.set("n", "<leader>fm", ":Fzf files<cr>", opts)

telescope.load_extension "file_browser"
vim.keymap.set("n", "<leader>fw", ":Telescope file_browser<cr>", opts)
