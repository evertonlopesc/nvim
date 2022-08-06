require("neo-tree").setup {
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
