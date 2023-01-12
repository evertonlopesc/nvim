local neo = require('neotest')
local rspec = require('neotest-rspec')
local ldev = require('neodev')

ldev.setup({
  library = { plugins = { 'neotest' }, types = true },
})

neo.setup({
  adapters = {
    rspec({}),
  },
})

local opts = { noremap = true, silent = true }
vim.keymap.set(
  'n',
  '<leader>nf',
  ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
  opts
)
vim.keymap.set('n', '<leader>nu', ":lua require('neotest').run.run()<CR>", opts)
vim.keymap.set(
  'n',
  '<leader>na',
  ":lua require('neotest').run.run(vim.fn.getcwd())<CR>",
  opts
)
vim.keymap.set(
  'n',
  '<leader>ns',
  ":lua require('neotest').summary.open()<CR>",
  opts
)
