--[[ local ruby_nvim = require("ruby_nvim")

ruby_nvim.setup({
  test_cmd = "ruby" -- command that :RubyTest is gonna run,
  test_args = {} -- args that :RubyTest is gonna run
}) ]]

vim.opt.colorcolumn = "120"
vim.opt.textwidth = 120
vim.opt.indentkeys = "0{,0},0), 0], !^F, o, O, e, :, =end, =else, =elsif, =when, =in, =ensure, =rescue, ==begin, ==end, =private, =protected, =public"

