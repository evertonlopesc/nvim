local neo = require('neotest')
local rspec = require('neotest-rspec')
local ldev = require('neodev')
local nmap = require('./../config/map').nmap

ldev.setup({
  library = { plugins = { 'neotest' }, types = true },
})

neo.setup({
  adapters = {
    rspec({}),
  },
})

nmap('<leader>nf', ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>")
nmap('<leader>nu', ":lua require('neotest').run.run()<CR>")
nmap('<leader>na', ":lua require('neotest').run.run(vim.fn.getcwd())<CR>")
nmap('<leader>ns', ":lua require('neotest').summary.open()<CR>")
