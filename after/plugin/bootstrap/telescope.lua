local actions = require "telescope.actions"
local telescope = require("telescope")
require('telescope').load_extension('fzf')

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
      theme = "dropdown",
      find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
    },
    live_grep = {
      theme = "dropdown",
    },
    oldfiles = {
      theme = "dropdown",
    },
    lsp_document_symbols = {
      theme = "dropdown",
    },
    buffers = {
      theme = "dropdown",
    },
    keymaps = {
      theme = "dropdown",
    },
    file_browser = {
      theme = "dropdown",
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}

local builtin = require("telescope.builtin")

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>st", ":Telescope <CR>", opts)
vim.keymap.set("n", "<leader>sf", builtin.find_files, opts)
vim.keymap.set("n", "<leader>sg", builtin.live_grep, opts)
vim.keymap.set("n", "<leader>so", builtin.oldfiles, opts)
vim.keymap.set("n", "<leader>sl", builtin.lsp_document_symbols, opts)
vim.keymap.set("n", "<leader>sb", builtin.buffers, opts)
vim.keymap.set("n", "<leader>sk", builtin.keymaps, opts)

telescope.load_extension "file_browser"
vim.keymap.set("n", "<leader>sw", ":Telescope file_browser<cr>", opts)
