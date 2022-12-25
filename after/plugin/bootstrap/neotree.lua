local status, neo_tree = pcall(require, "neo-tree")

if not status then
  return
end

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
