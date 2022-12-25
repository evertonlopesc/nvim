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
