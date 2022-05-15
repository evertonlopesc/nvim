require('nightfox').setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled", -- Compiled file suffix
    transparent = false,    -- Disable setting background
    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false,   -- Non focused panes set to alternative background
    styles = {              -- Style to be applied to different syntax groups
      comments = "italic",
      keywords = "bold",
      types = "italic, bold",
      functions = "bold",
      --[[ comments = "NONE",    -- Value is any valid attr-list value `:help attr-list`
      keywords = "NONE",
      numbers = "NONE",
      strings = "NONE",
      types = "NONE",
      variables = "NONE", ]]
    },
    inverse = {             -- Inverse highlight for different types
      match_paren = false,
      visual = false,
      search = false,
    },
    modules = {             -- List of various plugins and additional options
      cmp = true,
      gitsigns = true,
      hop = true,
      lsp_trouble = true,
      native_lsp = true,
      nvimtree = true,
      telescope = true,
      treesitter = true,
      tsrainbow = true,
      whichkey = true
    },
    palettes = {
      all = {
        red = { base = "#994D62", bright = "#C7647F", dim = "#804052" },
      },
      dayfox = {
        red = { base = "#994D62", bright = "#C7647F", dim = "#804052" },
      },
    }
  }
})

require("nightfox").load('nightfox')
