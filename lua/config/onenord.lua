require('onenord').setup({
  theme = "dark", -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
  borders = true, -- Split window borders
  fade_nc = false, -- Fade non-current windows, making them more distinguishable
  styles = {
    comments = "italic", -- Style that is applied to comments: see `highlight-args` for options
    strings = "italic", -- Style that is applied to strings: see `highlight-args` for options
    keywords = "NONE", -- Style that is applied to keywords: see `highlight-args` for options
    functions = "bold", -- Style that is applied to functions: see `highlight-args` for options
    variables = "NONE", -- Style that is applied to variables: see `highlight-args` for options
    diagnostics = "NONE", -- Style that is applied to diagnostics: see `highlight-args` for options
  },
  disable = {
    background = false, -- Disable setting the background color
    cursorline = false, -- Disable the cursorline
    eob_lines = true, -- Hide the end-of-buffer lines
  },
  custom_highlights = {},
  custom_colors = {
  }
})
