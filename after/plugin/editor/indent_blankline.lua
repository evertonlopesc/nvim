vim.opt.termguicolors = true
local opt = vim.opt
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")
vim.cmd([[highlight IndentBlanklineIndent1 guifg=#c5c5c5 gui=nocombine]])

require("indent_blankline").setup({
  show_end_of_line = true,
  space_char_blankline = " ",
  char_highlight_list = {
    "IndentBlanklineIndent1",
  },
})
