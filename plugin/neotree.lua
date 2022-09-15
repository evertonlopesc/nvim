local neo_tree = require("neo-tree")

neo_tree.setup {
  window = {
    mappings = {
      ["o"] = "open"
    },
  },

  filesystem = {
    follow_current_file = true,
    window = {
      mappings = {
        ["o"] = "open"
      }
    }
  }
}
