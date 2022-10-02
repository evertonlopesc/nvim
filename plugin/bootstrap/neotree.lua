vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]

local neo_tree = require "neo-tree"

neo_tree.setup {
  close_if_last_window = false,
  window = {
    position = "left",
    mappings = {
      ["o"] = "open",
    },
  },

  filesystem = {
    follow_current_file = true,
    window = {
      mappings = {
        ["o"] = "open",
      },
    },
  },
}

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-n>", "<cmd> Neotree toggle left <cr>", opts)
vim.keymap.set("n", "<leader>fb", "<cmd> Neotree toggle show buffers right <cr>", opts)
